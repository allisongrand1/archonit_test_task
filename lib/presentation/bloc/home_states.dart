import 'package:archonit_test_task/domain/models/coin.dart';

sealed class HomeStates {
  final List<Coin> coins;
  final bool uploadedAllCoins;

  HomeStates(this.coins, this.uploadedAllCoins);

  static HomeStates init(List<Coin> coins, bool uploadedAllCoins) => InitialState(coins, uploadedAllCoins);

  static HomeStates loading(List<Coin> coins, bool uploadedAllCoins) => LoadingState(coins, uploadedAllCoins);

  static HomeStates loaded(List<Coin> coins, bool uploadedAllCoins) => LoadedState(coins, uploadedAllCoins);

  static HomeStates error(List<Coin> coins, bool uploadedAllCoins, String error) =>
      ErrorState(error, coins, uploadedAllCoins);
}

class InitialState extends HomeStates {
  InitialState(super.coins, super.uploadedAllCoins);
}

class LoadingState extends HomeStates {
  LoadingState(super.coins, super.uploadedAllCoins);
}

class LoadedState extends HomeStates {
  LoadedState(super.coins, super.uploadedAllCoins);
}

class ErrorState extends HomeStates {
  final String error;

  ErrorState(this.error, super.coins, super.uploadedAllCoins);
}

extension HomeStatesExtension on HomeStates {
  T map<T>({
    required T Function() init,
    required T Function() loading,
    required T Function(LoadedState state) loaded,
    required T Function(ErrorState state) error,
  }) {
    return switch (this) {
      InitialState _ => init(),
      LoadingState _ => loading(),
      LoadedState state => loaded(state),
      ErrorState state => error(state),
    };
  }
}
