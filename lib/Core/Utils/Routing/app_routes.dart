import 'package:flutter/cupertino.dart';
import 'package:taxi_go_user_version/Features/Auth/screens/log_in/forget_password_screen.dart';
import 'package:taxi_go_user_version/Features/Auth/screens/log_in/forget_password_send_otp_screen.dart';
import 'package:taxi_go_user_version/Features/Auth/screens/log_in/log_in_screen.dart';
import 'package:taxi_go_user_version/Features/Auth/screens/log_in/login_otp_screen.dart';
import 'package:taxi_go_user_version/Features/Auth/screens/log_in/set_new_password_screen.dart';
import 'package:taxi_go_user_version/Features/Auth/screens/log_in/verification_phone_screen.dart';
import 'package:taxi_go_user_version/Features/Auth/screens/sign_up/create_profile_screen.dart';
import 'package:taxi_go_user_version/Features/Auth/screens/sign_up/otp_screen.dart';
import 'package:taxi_go_user_version/Features/Auth/screens/sign_up/set_password_screen.dart';
import 'package:taxi_go_user_version/Features/Auth/screens/sign_up/sign_up_screen.dart';
import 'package:taxi_go_user_version/Features/Chat/chat.dart';
import 'package:taxi_go_user_version/Features/Favourite/Screens/trip_favourite.dart';
import 'package:taxi_go_user_version/Features/HiringDriver/screens/Cancelbooking/cancelbooking.dart';
import 'package:taxi_go_user_version/Features/HiringDriver/screens/Payment/payment.dart';
import 'package:taxi_go_user_version/Features/HiringDriver/screens/Rating/rate.dart';
import 'package:taxi_go_user_version/Features/History/Screens/my_history.dart';
import 'package:taxi_go_user_version/Features/Home/screens/general_screen.dart';
import 'package:taxi_go_user_version/Features/Profile/profile.dart';
import 'package:taxi_go_user_version/Features/Saved/Screens/trip_saved.dart';
import 'package:taxi_go_user_version/Features/Splash/screens/welcome_screen.dart';
import 'package:taxi_go_user_version/Features/Wallet/screens/wallet_screen.dart';
import 'package:taxi_go_user_version/Features/notification/screens/notification_screen.dart';
import '../../../Features/Map/screens/map_screens.dart';
import '../../../Features/Splash/screens/splash_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String welcome = '/welcome';
  static const String signUp = '/signUp';
  static const String otp = '/otp';
  static const String setPassword = '/setPassword';
  static const String setNewPassword = '/setNewPassword';
  static const String setProfile = '/setProfile';
  static const String logIn = '/logIn';
  static const String forgetPassword = '/forgetPassword';
  static const String forgetPasswordSendOtp = '/forgetPasswordSendOtp';
  static const String generalScreen = '/generalscreen';
  static const String payment = '/payment';
  static const String rate = '/rate';
  static const String cancelbooing = '/cancelbooing';
  static const String wallet = '/wallet';
  static const String verificationPhoneAndPassword =
      '/verificationPhoneAndPassword';
  static const String mapScreen = '/MapScreen';
  static const String history = '/history';
  static const String tripFavourite = '/tripFavourite';
  static const String tripSaved = '/tripSaved';
  static const String chat = '/chat';
  static const String profile = '/profile';
  static const String loginOtpScreen = '/loginOtpScreen';
  static const String notificationScreen = '/notificationScreen';

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
            return const CreateProfileScreen();
          },
        );
      case logIn:
        return CupertinoPageRoute(
          builder: (context) {
            return const LogInScreen();
          },
        );
      case verificationPhoneAndPassword:
        return CupertinoPageRoute(
          builder: (context) {
            return const VerificationPhoneAndPasswordScreen();
          },
        );
      case forgetPassword:
        return CupertinoPageRoute(
          builder: (context) {
            return const ForgetPasswordScreen();
          },
        );
      case forgetPasswordSendOtp:
        return CupertinoPageRoute(
          builder: (context) {
            return const ForgetPasswordSendOtpScreen();
          },
        );
      case setNewPassword:
        return CupertinoPageRoute(
          builder: (context) {
            return const SetNewPasswordScreen();
          },
        );
      case generalScreen:
        return CupertinoPageRoute(
          builder: (context) {
            return const GeneralScreen();
          },
        );

      case payment:
        return CupertinoPageRoute(
          builder: (context) {
            return const PaymentScreen();
          },
        );

      case rate:
        return CupertinoPageRoute(
          builder: (context) {
            return const RateScreen();
          },
        );

      case cancelbooing:
        return CupertinoPageRoute(
          builder: (context) {
            return const CancelBookingScreen();
          },
        );

      case wallet:
        return CupertinoPageRoute(
          builder: (context) {
            return const WalletScreen();
          },
        );
      case notificationScreen:
        return CupertinoPageRoute(
          builder: (context) {
            return const NotificationScreen();
          },
        );
      case mapScreen:
        return CupertinoPageRoute(
          builder: (context) {
            return const MapScreen();
          },
        );

      case chat:
        return CupertinoPageRoute(
          builder: (context) {
            return ChatScreen();
          },
        );

      case profile:
        return CupertinoPageRoute(
          builder: (context) {
            return const ProfileScreen();
          },
        );
      case tripFavourite:
        return CupertinoPageRoute(
          builder: (context) {
            return const FavouriteScreen();
          },
        );
      case tripSaved:
        return CupertinoPageRoute(
          builder: (context) {
            return const SavedScreen();
          },
        );

      case history:
        return CupertinoPageRoute(
          builder: (context) {
            return const HistoryScreen();
          },
        );
      case loginOtpScreen:
        return CupertinoPageRoute(
          builder: (context) {
            return const LoginOtpScreen();
          },
        );

      default:
        return CupertinoPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
