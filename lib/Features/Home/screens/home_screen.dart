import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Assets/images/app_images.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_app_bottom.dart';
import '../../../Core/Utils/Routing/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                AppImages.mapTest,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Positioned(
              bottom: 10,
              right: 15,
              left: 15,
              child: CustomAppBottom(
                bottomColor: AppColors.blueColor,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.mapScreen);
                },
                text: 'Where to?',
                textColor: AppColors.whiteColor,
                hasIcon: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
