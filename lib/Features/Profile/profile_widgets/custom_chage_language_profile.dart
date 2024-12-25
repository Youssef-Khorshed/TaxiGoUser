import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/enums/localization.dart';
import 'package:taxi_go_user_version/Core/Utils/localization/cubit/local_cubit.dart';

class CustomChagelanguageProfile extends StatefulWidget {
  const CustomChagelanguageProfile({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomChagelanguageProfileState createState() =>
      _CustomChagelanguageProfileState();
}

class _CustomChagelanguageProfileState
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
            isArabic = value;
            isArabic
                ? LocalCubit.get(context).localizationThemeState =
                    LocalizationThemeState.ar
                : LocalCubit.get(context).localizationThemeState =
                    LocalizationThemeState.en;
          });
        },
        activeTrackColor: AppColors.blueColor2,
        activeColor: AppColors.whiteColor,
      ),
    );
  }
}
