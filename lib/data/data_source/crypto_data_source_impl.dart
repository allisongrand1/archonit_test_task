import 'package:archonit_test_task/data/data_source/crypto_data_source.dart';
import 'package:archonit_test_task/data/models/crypto_response.dart';
import 'package:dio/dio.dart';

import 'endpoint.dart';

class CryptoDataSourceImpl extends CryptoDataSource {
  final Dio dio;

  CryptoDataSourceImpl({required this.dio});

  @override
  Future<CryptoResponse> getCoins({int limit = 15, int offset = 0}) async {
    try {
      final query = {'limit': limit, 'offset': offset};

      final response = await dio.get(assets, queryParameters: query);

      return CryptoResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.toString());
    }
  }
}
