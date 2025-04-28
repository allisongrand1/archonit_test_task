import 'package:archonit_test_task/domain/use_cases/get_coins_use_case.dart';
import 'package:archonit_test_task/domain/use_cases/update_coins_use_case.dart';
import 'package:archonit_test_task/presentation/bloc/home_events.dart';
import 'package:archonit_test_task/presentation/bloc/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvents, HomeStates> {
  final GetCoinsUseCase getCoinsUseCase;
  final UpdateCoinsUseCase updateCoinsUseCase;

  static int limit = 15;

  HomeBloc({required this.getCoinsUseCase, required this.updateCoinsUseCase}) : super(InitialState([], false)) {
    on<HomeEvents>(
      (event, emit) =>
          event.map(init: (event) => _getCoins(event, emit), updateCoins: (event) => _updateCoins(event, emit)),
    );
  }

  Future<void> _getCoins(GetCoinsEvent event, Emitter<HomeStates> emit) async {
    emit(LoadingState(state.coins, state.uploadedAllCoins));

    try {
      final coins = await getCoinsUseCase.call();

      final updateCoinsUseCase = coins.length < limit;

      emit(LoadedState(coins, updateCoinsUseCase));
    } catch (e) {
      emit(ErrorState(e.toString(), state.coins, state.uploadedAllCoins));
    }
  }

  Future<void> _updateCoins(UpdateCoinsEvent event, Emitter<HomeStates> emit) async {
    if (state is LoadedState && !state.uploadedAllCoins) {
      try {
        final coins = await updateCoinsUseCase.call(offset: state.coins.length);

        final uploadedAllCoins = coins.length < limit;

        emit(LoadedState([...state.coins, ...coins], uploadedAllCoins));
      } catch (e) {
        emit(ErrorState(e.toString(), state.coins, state.uploadedAllCoins));
      }
    }
  }
}
