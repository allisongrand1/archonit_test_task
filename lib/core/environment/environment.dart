import 'package:archonit_test_task/core/environment/environment_interface.dart';
import 'package:dio/dio.dart';

enum EnvironmentType { product }

abstract class Environment {
  static EnvironmentInterface _environment = ProductEnvironment();

  static void setEnvironment(EnvironmentType type) {
    _environment = switch (type) {
      EnvironmentType.product => ProductEnvironment(),
    };
  }

  static BaseOptions get baseOptions => _environment.baseOptions;
}
