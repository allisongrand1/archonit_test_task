import 'package:dio/dio.dart';

import 'environment/environment.dart';

class Infrastructure {
  final Dio dio;

  Infrastructure({required this.dio});

  factory Infrastructure.base() => _BaseInfrastructure();
}

class _BaseInfrastructure extends Infrastructure {
  _BaseInfrastructure() : super(dio: Dio(Environment.baseOptions));
}
