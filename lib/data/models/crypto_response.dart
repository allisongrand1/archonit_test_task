import 'package:archonit_test_task/data/models/crypto_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_response.freezed.dart';
part 'crypto_response.g.dart';

@freezed
abstract class CryptoResponse with _$CryptoResponse {
  const factory CryptoResponse({required List<CryptoData> data}) = _CryptoResponse;

  factory CryptoResponse.fromJson(Map<String, dynamic> json) => _$CryptoResponseFromJson(json);
}
