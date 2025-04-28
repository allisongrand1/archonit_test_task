sealed class HomeEvents {
  static HomeEvents init() => GetCoinsEvent();

  static HomeEvents updateCoins() => UpdateCoinsEvent();
}

class GetCoinsEvent extends HomeEvents {}

class UpdateCoinsEvent extends HomeEvents {}

extension HomeEventsExtension on HomeEvents {
  T map<T>({required T Function(GetCoinsEvent) init, required T Function(UpdateCoinsEvent) updateCoins}) {
    return switch (this) {
      GetCoinsEvent event => init(event),
      UpdateCoinsEvent event => updateCoins(event),
    };
  }
}
