import 'package:archonit_test_task/core/di/di_providers.dart';
import 'package:archonit_test_task/core/infrastructure.dart';

abstract class DI {
  DIProviders get providers;

  factory DI.base(Infrastructure infrastructure) => _BaseDi(infrastructure);
  factory DI.test(Infrastructure infrastructure) => _TestDi(infrastructure);
}

class _BaseDi implements DI {
  final Infrastructure infrastructure;

  @override
  final DIProviders providers;

  _BaseDi(this.infrastructure) : providers = DIProviders.base(infrastructure);
}

class _TestDi implements DI {
  final Infrastructure infrastructure;

  @override
  final DIProviders providers;

  _TestDi(this.infrastructure) : providers = DIProviders.test(infrastructure);
}
