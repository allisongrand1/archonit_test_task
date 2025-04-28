import 'package:archonit_test_task/core/di/providers/data_source_providers.dart';
import 'package:archonit_test_task/domain/use_cases/get_coins_use_case.dart';
import 'package:archonit_test_task/domain/use_cases/update_coins_use_case.dart';

class UseCaseProviders {
  final GetCoinsUseCase getCoinsUseCase;
  final UpdateCoinsUseCase updateCoinsUseCase;

  UseCaseProviders({required this.getCoinsUseCase, required this.updateCoinsUseCase});

  factory UseCaseProviders.base(DataSourceProviders dataSourceProviders) {
    return UseCaseProviders(
      getCoinsUseCase: GetCoinsUseCase(dataSourceProviders.coinDataSource),
      updateCoinsUseCase: UpdateCoinsUseCase(dataSourceProviders.coinDataSource),
    );
  }
}
