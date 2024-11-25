import 'package:flutter/cupertino.dart';
import 'package:taxi_go_user_version/Features/Auth/screens/log_in/log_in_screen.dart';
import 'package:taxi_go_user_version/Features/Auth/screens/sign_up/create_profile_screen.dart';
import 'package:taxi_go_user_version/Features/Auth/screens/sign_up/otp_screen.dart';
import 'package:taxi_go_user_version/Features/Auth/screens/sign_up/set_password_screen.dart';
import 'package:taxi_go_user_version/Features/Auth/screens/sign_up/sign_up_screen.dart';
import 'package:taxi_go_user_version/Features/Splash/screens/welcome_screen.dart';

import '../../../Features/Splash/screens/splash_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String welcome = '/welcome';
  static const String signUp = '/signUp';
  static const String otp = '/otp';
  static const String setPassword = '/setPassword';
  static const String setProfile = '/setProfile';
  static const String logIn = '/logIn';

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
      case setPassword:
        return CupertinoPageRoute(
          builder: (context) {
            return const SetPasswordScreen();
          },
        );
      case setProfile:
        return CupertinoPageRoute(
          builder: (context) {
            return CreateProfileScreen();
          },
        );
      case logIn:
        return CupertinoPageRoute(
          builder: (context) {
            return const LogInScreen();
          },
        );
      default:
        return CupertinoPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
