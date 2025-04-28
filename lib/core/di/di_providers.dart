import 'package:archonit_test_task/core/di/providers/bloc_providers.dart';
import 'package:archonit_test_task/core/di/providers/data_source_providers.dart';
import 'package:archonit_test_task/core/di/providers/use_case_providers.dart';
import 'package:archonit_test_task/core/infrastructure.dart';

class DIProviders {
  final UseCaseProviders useCaseProviders;
  final DataSourceProviders dataSourceProviders;
  final BlocProviders blocProviders;

  DIProviders._({required this.useCaseProviders, required this.dataSourceProviders, required this.blocProviders});

  factory DIProviders.base(Infrastructure infrastructure) {
    final dataSourceProviders = DataSourceProviders.base(infrastructure);
    final useCaseProviders = UseCaseProviders.base(dataSourceProviders);
    final blocProviders = BlocProviders.base(useCaseProviders);

    return DIProviders._(
      useCaseProviders: useCaseProviders,
      dataSourceProviders: dataSourceProviders,
      blocProviders: blocProviders,
    );
  }

  factory DIProviders.test(Infrastructure infrastructure) {
    final dataSourceProviders = DataSourceProviders.base(infrastructure);
    final useCaseProviders = UseCaseProviders.base(dataSourceProviders);
    final blocProviders = BlocProviders.base(useCaseProviders);

    return DIProviders._(
      useCaseProviders: useCaseProviders,
      dataSourceProviders: dataSourceProviders,
      blocProviders: blocProviders,
    );
  }
}
