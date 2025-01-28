import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/enums/localization.dart';
import 'package:taxi_go_user_version/Core/Utils/localization/cubit/local_cubit.dart';

class CustomChagelanguageProfile extends StatefulWidget {
  const CustomChagelanguageProfile({
    super.key,
  });

  @override
  CustomChagelanguageProfileState createState() =>
      CustomChagelanguageProfileState();
}

class CustomChagelanguageProfileState
    extends State<CustomChagelanguageProfile> {
  @override
  Widget build(BuildContext context) {
    bool isArabic = LocalCubit.get(context).localizationThemeState ==
        LocalizationThemeState.ar;
    return Transform.scale(
      scale: 0.8,
      child: Switch(
        value: isArabic,
        onChanged: (value) {
          setState(() {
            if (isArabic == true) {
              value = false;
            } else {
              value = true;
            }
            LocalCubit.get(context).changeLocale();
          });
        },
        activeTrackColor: AppColors.blueColor,
        activeColor: AppColors.whiteColor,
      ),
    );
  }
}
