import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            .copyWith(color: AppColors.grayColor, fontSize: 14.sp),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.blackColor, width: 1.w),
            borderRadius: BorderRadius.all(Radius.circular(8.r))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.blueColor, width: 1.w),
            borderRadius: BorderRadius.all(Radius.circular(8.r))),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.redColor, width: 1.w),
            borderRadius: BorderRadius.all(Radius.circular(8.r))),
        errorMaxLines: 1,
        errorStyle: AppTextStyles.style16WhiteW500
            .copyWith(fontSize: 14.sp, color: AppColors.redColor),
        suffixIcon: IconButton(
          icon: Icon(
            obscureText ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
            size: 18.sp,
            color: Colors.grey,
          ),
          onPressed: onVisibilityChanged,
        ),
      ),
    );
  }
}
