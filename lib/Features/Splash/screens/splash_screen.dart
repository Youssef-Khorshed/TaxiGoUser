import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Assets/images/app_images.dart';
import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';

import '../../../Core/Utils/Network/Services/secure_token.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Image.asset(
          AppImages.splashImage,
          fit: BoxFit.cover,
          width: width,
          height: height,
        ),
      ),
    );
  }

  navigateToHome() async {
    var token = await SecureToken.getToken();
    if (token != null) {
      Navigator.pushReplacementNamed(context, AppRoutes.generalScreen);
    } else {
      Future.delayed(const Duration(seconds: 5), () {
        Navigator.pushReplacementNamed(context, AppRoutes.welcome);
      });
    }
  }
}
