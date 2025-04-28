import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_data.freezed.dart';
part 'crypto_data.g.dart';

@freezed
abstract class CryptoData with _$CryptoData {
  const factory CryptoData({
    @Default('') String id,
    @Default('') String rank,
    @Default('') String symbol,
    @Default('') String name,
    @Default('') String supply,
    @Default('') String maxSupply,
    @Default('') String marketCapUsd,
    @Default('') String volumeUsd24Hr,
    @Default('') String priceUsd,
    @Default('') String changePercent24Hr,
    @Default('') String vwap24Hr,
    @Default('') String explorer,
  }) = _CryptoData;

  factory CryptoData.fromJson(Map<String, dynamic> json) => _$CryptoDataFromJson(json);
}
