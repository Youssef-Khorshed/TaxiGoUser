import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';

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
  bool _isEnglish = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AutoSizeText(
          _isEnglish ? 'Language' : 'اللغة',
          key: ValueKey<bool>(_isEnglish),
          style: AppTextStyles.style24BlackW500,
        ),
        const Spacer(),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(scale: animation, child: child);
          },
          child: AutoSizeText(
            _isEnglish ? 'English' : 'العربية',
            key: ValueKey<bool>(_isEnglish),
            style: AppTextStyles.style24BlackW500,
          ),
        ),
        Switch(
          value: _isEnglish,
          onChanged: (value) {
            setState(() {
              _isEnglish = value;
            });

            widget.toggleLanguage();
          },
          activeTrackColor: AppColors.blueColor,
          activeColor: AppColors.whiteColor,
        ),
      ],
    );
  }
}
