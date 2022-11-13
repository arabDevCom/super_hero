import 'package:flutter/material.dart';
import 'package:super_hero/feature/home_page/presentation/screens/home_page.dart';

import '../../core/utils/app_strings.dart';
import '../../feature/splash/presentation/screens/splash_screen.dart';


class Routes {
  static const String initialRoute = '/';
  static const String homePageRoute = '/homePage';

}

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
        case Routes.homePageRoute:
        return MaterialPageRoute(
          builder: (context) => const HomePageScreen(),

        );

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}