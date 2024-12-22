import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';

class CustomSetPasswordFormField extends StatelessWidget {
  final String lableText;
  final bool obscureText;
  final VoidCallback onVisibilityChanged;

  const CustomSetPasswordFormField({
    super.key,
    required this.lableText,
    required this.obscureText,
    required this.onVisibilityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: lableText,
        labelStyle: AppTextStyles.style16WhiteW500
            .copyWith(color: AppColors.grayColor, fontSize: 14),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.blackColor, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.blueColor, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.redColor, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        errorMaxLines: 1,
        errorStyle: AppTextStyles.style16WhiteW500
            .copyWith(fontSize: 14, color: AppColors.redColor),
        suffixIcon: IconButton(
          icon: Icon(
            obscureText ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
            size: 18,
            color: Colors.grey,
          ),
          onPressed: onVisibilityChanged,
        ),
      ),
    );
  }
}
