import 'package:flutter/cupertino.dart';
import 'package:taxi_go_user_version/Features/Auth/screens/sign_up/otp_screen.dart';
import 'package:taxi_go_user_version/Features/Auth/screens/sign_up/sign_up_screen.dart';
import 'package:taxi_go_user_version/Features/Splash/screens/welcome_screen.dart';

import '../../../Features/Splash/screens/splash_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String welcome = '/welcome';
  static const String signUp = '/signUp';
  static const String otp = '/otp';

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
      case signUp:
        return CupertinoPageRoute(
          builder: (context) {
            return const SignUpScreen();
          },
        );
      case otp:
        return CupertinoPageRoute(
          builder: (context) {
            return const OtpScreen();
          },
        );
      default:
        return CupertinoPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
