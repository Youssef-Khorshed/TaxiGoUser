import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';

import '../../../../../Core/Utils/Text/text_style.dart';

class CustomLogInFormField extends StatefulWidget {
  final String? hintText, labelText;
  final bool obscureText, isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  const CustomLogInFormField(
      {super.key,
      this.hintText,
      required this.obscureText,
      required this.isPassword,
      this.controller,
      this.validator,
      this.onTap,
      this.labelText});

  @override
  State<CustomLogInFormField> createState() => _CustomLogInFormFieldState();
}

class _CustomLogInFormFieldState extends State<CustomLogInFormField> {
  bool isPasswordHidden = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isPassword && isPasswordHidden,
        keyboardType: TextInputType.text,
        validator: widget.validator,
        onTap: widget.onTap,
        decoration: InputDecoration(
          labelStyle: AppTextStyles.style16WhiteW500.copyWith(
            fontSize: 15,
            color: AppColors.grayColor,
          ),
          enabledBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.blackColor, width: 1.w),
            borderRadius: BorderRadius.all(
              Radius.circular(8.r),
            ),
          ),
          focusedBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.blueColor, width: 1.w),
            borderRadius: BorderRadius.all(
              Radius.circular(8.r),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.redColor, width: 1.w),
            borderRadius: BorderRadius.all(
              Radius.circular(8.r),
            ),
          ),
          errorMaxLines: 1,
          errorStyle: AppTextStyles.style16WhiteW500
              .copyWith(fontSize: 14.sp, color: AppColors.redColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide:  BorderSide(color: AppColors.grayColor, width: 1.w),
          ),
          labelText: widget.labelText,
          hintText: widget.hintText,
          hintStyle: AppTextStyles.style16WhiteW500
              .copyWith(color: AppColors.grayColor),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(isPasswordHidden
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined),
                  onPressed: () {
                    isPasswordHidden = !isPasswordHidden;
                    setState(() {});
                  },
                )
              : null,
        ),
      ),
    );
  }
}
