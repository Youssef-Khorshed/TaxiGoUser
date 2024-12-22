import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Core/Utils/enums/localization.dart';
import 'package:taxi_go_user_version/Core/Utils/localization/cubit/local_cubit.dart';

class CustomChagelanguageProfile extends StatefulWidget {
  final VoidCallback toggleLanguage;

  const CustomChagelanguageProfile({super.key, required this.toggleLanguage});

  @override
  // ignore: library_private_types_in_public_api
  _CustomChagelanguageProfileState createState() =>
      _CustomChagelanguageProfileState();
}

class _CustomChagelanguageProfileState
    extends State<CustomChagelanguageProfile> {
  @override
  Widget build(BuildContext context) {
    bool isEnglish = LocalCubit.get(context).localizationThemeState ==
        LocalizationThemeState.en;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AutoSizeText(
          isEnglish ? 'Language' : 'اللغة',
          key: ValueKey<bool>(isEnglish),
          style: AppTextStyles.style24BlackW500,
        ),
        const Spacer(),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(scale: animation, child: child);
          },
          child: AutoSizeText(
            isEnglish ? 'English' : 'العربية',
            key: ValueKey<bool>(isEnglish),
            style: AppTextStyles.style24BlackW500,
          ),
        ),
        horizontalSpace(5),
        Transform.scale(
          scale: 0.8,
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Switch(
              value: isEnglish,
              onChanged: (value) {
                setState(() {
                  isEnglish = value;
                });

                widget.toggleLanguage();
              },
              activeTrackColor: AppColors.blueColor,
              activeColor: AppColors.whiteColor,
            ),
          ),
        ),
      ],
    );
  }
}
