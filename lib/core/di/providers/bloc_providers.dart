import 'package:archonit_test_task/core/di/providers/use_case_providers.dart';
import 'package:archonit_test_task/presentation/bloc/home_bloc.dart';

class BlocProviders {
  final HomeBloc homeBloc;

  BlocProviders({required this.homeBloc});

  factory BlocProviders.base(UseCaseProviders useCaseProviders) {
    return BlocProviders(
      homeBloc: HomeBloc(
        getCoinsUseCase: useCaseProviders.getCoinsUseCase,
        updateCoinsUseCase: useCaseProviders.updateCoinsUseCase,
      ),
    );
  }
}
