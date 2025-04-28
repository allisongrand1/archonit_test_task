import 'package:flutter/material.dart';

class CoinTile extends StatelessWidget {
  final String symbol;
  final String priceUsd;
  final Color color;
  const CoinTile({super.key, required this.symbol, required this.priceUsd, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(18)),
            child: SizedBox(width: 56, height: 56),
          ),
          Expanded(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: Text(symbol))),
          Text('\$${priceUsd.toString()}'),
        ],
      ),
    );
  }
}
