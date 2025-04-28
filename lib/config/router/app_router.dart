import 'package:archonit_test_task/config/router/app_routes.dart';
import 'package:archonit_test_task/presentation/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter routerConfig() {
    return GoRouter(
      initialLocation: AppRoutes.home.path,
      routes: [
        GoRoute(path: AppRoutes.home.path, name: AppRoutes.home.name, builder: (context, state) => const HomeScreen()),
      ],
    );
  }
}
