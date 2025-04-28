import 'package:archonit_test_task/data/models/crypto_response.dart';

abstract class CryptoDataSource {
  Future<CryptoResponse> getCoins({int limit, int offset});
}
