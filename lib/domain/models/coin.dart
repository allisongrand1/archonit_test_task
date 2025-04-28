import 'dart:ui';

import 'package:equatable/equatable.dart';

class Coin extends Equatable {
  final String id;
  final String rank;
  final String symbol;
  final String name;
  final String supply;
  final String maxSupply;
  final String marketCapUsd;
  final String volumeUsd24Hr;
  final String priceUsd;
  final String changePercent24Hr;
  final String vWap24Hr;
  final String explorer;
  final Color color;

  const Coin({
    required this.id,
    required this.rank,
    required this.symbol,
    required this.name,
    required this.supply,
    required this.maxSupply,
    required this.marketCapUsd,
    required this.volumeUsd24Hr,
    required this.priceUsd,
    required this.changePercent24Hr,
    required this.vWap24Hr,
    required this.explorer,
    required this.color,
  });

  @override
  List<Object?> get props => [
    id,
    rank,
    symbol,
    name,
    supply,
    maxSupply,
    marketCapUsd,
    volumeUsd24Hr,
    priceUsd,
    changePercent24Hr,
    vWap24Hr,
    explorer,
    color,
  ];
}
