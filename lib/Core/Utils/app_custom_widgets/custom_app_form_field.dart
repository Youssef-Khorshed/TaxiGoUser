import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_go_user_version/Core/Utils/Assets/icons/app_icons.dart';
import 'package:taxi_go_user_version/Core/Utils/Assets/images/app_images.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';

import '../Colors/app_colors.dart';
import '../Text/text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomAppFormField extends StatefulWidget {
  final String? hintText;
  final bool obscureText, isPassword, isPhone;
  final Widget? iconWidget, prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function()? onTap;

  const CustomAppFormField(
      {super.key,
      required this.hintText,
      this.obscureText = false,
      this.isPassword = false,
      this.iconWidget,
      this.controller,
      this.validator,
      this.onTap,
      this.prefixIcon,
      this.isPhone = false});

  @override
  State<CustomAppFormField> createState() => _CustomAppFormFieldState();
}

class _CustomAppFormFieldState extends State<CustomAppFormField> {
  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword && isPasswordHidden,
      keyboardType: widget.isPhone ? TextInputType.phone : TextInputType.text,
      validator: widget.validator,
      onTap: widget.onTap,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        labelStyle: AppTextStyles.style16WhiteW500.copyWith(
          fontSize: 15.sp,
          color: AppColors.redColor,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.blueColor, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(8.r),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.redColor, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(8.r),
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grayColor, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(8.r),
          ),
        ),
        errorMaxLines: 1,
        errorStyle: AppTextStyles.style16WhiteW500
            .copyWith(fontSize: 14.sp, color: AppColors.redColor),
        icon: widget.iconWidget,
        hintText: widget.hintText,
        hintStyle: AppTextStyles.style16WhiteW500
            .copyWith(color: AppColors.grayColor, fontSize: 12.sp),
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
            : widget.isPhone &&
                    Localizations.localeOf(context).languageCode == 'ar'
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.countryCode,
                          style: AppTextStyles.style15Blue,
                        ),
                        SizedBox(width: 5.w),
                        Container(
                          width: 1.w,
                          height: 20.h,
                          color: AppColors.grayColor,
                        ),
                        SizedBox(width: 5.w),
                        SvgPicture.asset(
                          AppIcons.iraqiFlagIcon,
                          width: 20.w,
                        ),
                        horizontalSpace(5.w),
                      ],
                    ),
                  )
                : null,
        prefixIcon: widget.isPhone &&
                Localizations.localeOf(context).languageCode == 'en'
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    horizontalSpace(5.w),
                    SvgPicture.asset(
                      AppIcons.iraqiFlagIcon,
                      width: 20.w,
                    ),
                    horizontalSpace(5.w),
                    Container(
                      width: 1.w,
                      height: 20.h,
                      color: AppColors.grayColor,
                    ),
                    horizontalSpace(5.w),
                    Text(
                      AppLocalizations.of(context)!.countryCode,
                      style: AppTextStyles.style15Blue,
                    ),
                  ],
                ),
              )
            : null,
        contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      ),
      style: AppTextStyles.style16WhiteW500.copyWith(
        color: Colors.black,
      ),
    );
  }
}
