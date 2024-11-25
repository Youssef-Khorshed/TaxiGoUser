import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';

class CustomAuthFormField extends StatelessWidget {
  const CustomAuthFormField({
    super.key,
    this.onChanged,
    required this.hintText,
    this.obscureText = false,
  });
  final String hintText;
  final bool? obscureText;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: obscureText ?? false,
        validator: (data) {
          if (data!.isEmpty) {
            return 'field is required';
          }
          return null;
        },
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: hintText,
          labelStyle: AppTextStyles.style16WhiteW500
              .copyWith(fontSize: 15, color: AppColors.grayColor,),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.blackColor, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(8),),),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.blueColor, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(8),),),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.redColor, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(8),),),
          errorMaxLines: 1,
          errorStyle: AppTextStyles.style16WhiteW500
              .copyWith(fontSize: 14, color: AppColors.redColor),
        ));
  }
}
