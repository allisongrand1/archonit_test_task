import 'package:archonit_test_task/config/theme/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'config/router/app_router.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  late final GoRouter router;
  late final ThemeData themes;

  @override
  void initState() {
    super.initState();

    router = AppRouter.routerConfig();
    themes = AppThemes.createTheme(AppThemeType.light);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Archonit Test Task',
      theme: themes,
      routerConfig: router,
    );
  }
}
