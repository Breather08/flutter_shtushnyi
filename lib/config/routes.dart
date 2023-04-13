import 'package:shtushnyi/core/router.dart';
import 'package:shtushnyi/screens/home_screen.dart';

class AppRouter extends RouteManager {
  static const String home = '/';

  AppRouter() {
    addRoute(AppRouter.home, (context) => const HomeScreen());
  }
}
