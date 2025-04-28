import 'package:archonit_test_task/core/di/di.dart';
import 'package:archonit_test_task/core/di/providers/bloc_providers.dart';
import 'package:archonit_test_task/core/di/providers/data_source_providers.dart';
import 'package:archonit_test_task/core/di/providers/use_case_providers.dart';
import 'package:archonit_test_task/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class ProvidersWrapper extends StatefulWidget {
  final DI di;
  final Widget child;
  const ProvidersWrapper({required this.di, required this.child, super.key});

  @override
  State<ProvidersWrapper> createState() => _ProvidersWrapperState();
}

class _ProvidersWrapperState extends State<ProvidersWrapper> {
  late final DataSourceProviders dataSourceProviders;
  late final BlocProviders blocProviders;
  late final UseCaseProviders useCaseProviders;

  @override
  void initState() {
    super.initState();

    initProviders();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DataSourceProviders>.value(value: dataSourceProviders),
        Provider<UseCaseProviders>.value(value: useCaseProviders),
      ],
      child: MultiBlocProvider(
        providers: [BlocProvider<HomeBloc>.value(value: blocProviders.homeBloc)],
        child: widget.child,
      ),
    );
  }

  void initProviders() {
    dataSourceProviders = widget.di.providers.dataSourceProviders;
    blocProviders = widget.di.providers.blocProviders;
    useCaseProviders = widget.di.providers.useCaseProviders;
  }
}
