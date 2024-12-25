import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Assets/images/app_images.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import '../../../Core/Utils/app_custom_widgets/custom_app_bottom.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                      height: 265.h,
                      width: 410.w,
                    ),
                    verticalSpace(20.h),
                    Text(AppLocalizations.of(context)!.welcome,
                        style: AppTextStyles.style28WhiteW600),
                    Text(
                      AppLocalizations.of(context)!
                          .have_a_better_transport_experience,
                      style: AppTextStyles.style20WhiteW600,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: Column(
                children: [
                  CustomAppBottom(
                    textColor: AppColors.blueColor,
                    buttonColor: AppColors.whiteColor,
                    buttonText: AppLocalizations.of(context)!.create_an_account,
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.signUp);
                    },
                  ),
                  verticalSpace(10),
                  CustomAppBottom(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.logIn);
                    },
                    textColor: AppColors.whiteColor,
                    buttonColor: AppColors.transparentColor,
                    buttonText: AppLocalizations.of(context)!.logIn,
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
