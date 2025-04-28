import 'package:archonit_test_task/data/data_source/crypto_data_source.dart';
import 'package:archonit_test_task/data/mapper/crypto_response_mapper.dart';
import 'package:archonit_test_task/domain/models/coin.dart';

class UpdateCoinsUseCase {
  final CryptoDataSource coinsDataSource;

  UpdateCoinsUseCase(this.coinsDataSource);

  Future<List<Coin>> call({int? limit, required int offset}) async {
    try {
      final coinsResponse = await coinsDataSource.getCoins(offset: offset);

      return coinsResponse.toListDomain();
    } catch (e) {
      rethrow;
    }
  }
}
