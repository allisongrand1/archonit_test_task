import 'package:dio/dio.dart';

const String _apiUrl = 'https://rest.coincap.io/v3';

sealed class EnvironmentInterface {
  static Duration sendTimeout = const Duration(seconds: 10);
  static Duration connectTimeout = const Duration(seconds: 10);
  static Duration receiveTimeout = const Duration(seconds: 10);

  BaseOptions get baseOptions;
}

class ProductEnvironment implements EnvironmentInterface {
  static String get apiSecret => String.fromEnvironment(
    'secret',
    defaultValue: 'Bearer 83b540a65dd3fc030487619ac1124e72fd169f01950341e24b814354f4245686',
  );

  @override
  BaseOptions get baseOptions => BaseOptions(
    baseUrl: _apiUrl,
    connectTimeout: EnvironmentInterface.connectTimeout,
    receiveTimeout: EnvironmentInterface.receiveTimeout,
    sendTimeout: EnvironmentInterface.sendTimeout,
    headers: {'Authorization': apiSecret},
  );
}
