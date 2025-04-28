import 'dart:ui';

import 'package:archonit_test_task/core/extension/string_extension.dart';
import 'package:archonit_test_task/data/models/crypto_data.dart';
import 'package:archonit_test_task/data/models/crypto_response.dart';
import 'package:archonit_test_task/domain/models/coin.dart';

extension CryptoResponseMapper on CryptoResponse {
  List<Coin> toListDomain() {
    return data.map((coins) => coins.toDomain()).toList();
  }
}

extension CryptoDataMapper on CryptoData {
  Coin toDomain() {
    return Coin(
      id: id,
      rank: rank,
      symbol: symbol,
      name: name,
      supply: supply,
      maxSupply: maxSupply,
      marketCapUsd: marketCapUsd,
      volumeUsd24Hr: volumeUsd24Hr,
      priceUsd: priceUsd.toThousandString,
      changePercent24Hr: changePercent24Hr,
      vWap24Hr: vwap24Hr,
      explorer: explorer,
      color: Color(0xFF000000),
    );
  }
}
