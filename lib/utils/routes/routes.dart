import 'package:flutter/material.dart';
import 'package:my_tailor/utils/routes/routes_name.dart';
import 'package:my_tailor/view/login_screen.dart';
import 'package:my_tailor/view/splash_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreen());
      case RoutesName.loginScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text("No route is found"),
            ),
          );
        });
    }
  }
}
