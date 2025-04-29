import 'package:archonit_test_task/domain/models/coin.dart';
import 'package:archonit_test_task/presentation/controllers/color_controller.dart';
import 'package:archonit_test_task/presentation/widgets/coin_tile.dart';
import 'package:flutter/material.dart';

class HomeSuccessView extends StatelessWidget {
  final List<Coin> coins;
  final ColorController colorController;
  final ScrollController scrollController;
  final bool uploadedAllCoins;

  const HomeSuccessView({
    required this.coins,
    required this.uploadedAllCoins,

    required this.colorController,
    required this.scrollController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: coins.length + 1,
      itemBuilder: (context, index) {
        if (coins.length == index) {
          if (uploadedAllCoins) {
            return const SizedBox.shrink();
          } else {
            return const Padding(padding: EdgeInsets.all(16), child: Center(child: LinearProgressIndicator()));
          }
        }

        final coin = coins[index];
        var color = colorController.getRandomColor(index);

        return CoinTile(symbol: coin.symbol, priceUsd: coin.priceUsd, color: color);
      },
    );
  }
}
