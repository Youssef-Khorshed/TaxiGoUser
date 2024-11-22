import 'package:flutter/cupertino.dart';
import 'package:taxi_go_user_version/Features/splash/splash_screen.dart';
import 'package:taxi_go_user_version/Features/splash/welcome_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String welcome = '/welcome';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return CupertinoPageRoute(
          builder: (context) {
            return const SplashScreen();
          },
        );
      case welcome:
        return CupertinoPageRoute(
          builder: (context) {
            return const WelcomeScreen();
          },
        );
      default:
        return CupertinoPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
