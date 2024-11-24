import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Assets/images/app_images.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Features/Splash/screens/splash_widgets/custom_splash_bottom.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1D1AD8),
              Color(0xFF0F0E72),
            ],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      AppImages.welcomeCarImage,
                      height: 265,
                      width: 410,
                    ),
                    verticalSpace(20),
                    AutoSizeText("Welcome",
                        style: AppTextStyles.style24WhiteW500),
                    AutoSizeText(
                      "Have a better transport experience",
                      style: AppTextStyles.style16WhiteW500,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  CustomSplashBottom(
                    buttontext: 'Create an account',
                    onTap: () {},
                    textcolor: AppColors.blueColor,
                    buttonColor: AppColors.whiteColor,
                  ),
                  verticalSpace(10),
                  CustomSplashBottom(
                    buttontext: 'Log In',
                    onTap: () {},
                    textcolor: AppColors.whiteColor,
                    buttonColor: AppColors.transparentColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
