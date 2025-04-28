import 'package:archonit_test_task/data/data_source/crypto_data_source.dart';
import 'package:archonit_test_task/data/mapper/crypto_response_mapper.dart';
import 'package:archonit_test_task/domain/models/coin.dart';

class GetCoinsUseCase {
  final CryptoDataSource coinsDataSource;

  GetCoinsUseCase(this.coinsDataSource);

  Future<List<Coin>> call() async {
    try {
      final coinsResponse = await coinsDataSource.getCoins();

      return coinsResponse.toListDomain();
    } catch (e) {
      rethrow;
    }
  }
}
