import 'package:archonit_test_task/core/infrastructure.dart';
import 'package:archonit_test_task/data/data_source/crypto_data_source.dart';
import 'package:archonit_test_task/data/data_source/crypto_data_source_impl.dart';

class DataSourceProviders {
  final CryptoDataSource coinDataSource;

  DataSourceProviders({required this.coinDataSource});

  factory DataSourceProviders.base(Infrastructure infrastructure) {
    return DataSourceProviders(coinDataSource: CryptoDataSourceImpl(dio: infrastructure.dio));
  }
}
