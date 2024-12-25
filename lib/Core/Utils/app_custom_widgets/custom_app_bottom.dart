import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';

class CustomAppBottom extends StatelessWidget {
  final String? buttonText;
  final double? width;
  final VoidCallback onPressed;
  final Color? textColor, buttonColor, borderColor, iconColor;
  final bool hasIcon;
  final IconData? icon;

  final double? borderCornerRadius;
  const CustomAppBottom({
    this.borderColor,
    this.textColor,
    this.hasIcon = false,
    this.borderCornerRadius,
    this.buttonText,
    this.buttonColor,
    required this.onPressed,
    super.key,
    this.width,
    this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
              color: buttonColor ?? AppColors.blueColor,
              borderRadius: BorderRadius.circular(borderCornerRadius ?? 20.r),
              border: Border.all(
                  color: borderColor ?? Colors.transparent, width: .6.w)),
          height: 52.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              hasIcon
                  ? Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 0.h),
                      child: Icon(
                        icon,
                        size: 20.sp,
                        color: iconColor,
                      ),
                    )
                  : Container(),
              AutoSizeText(
                buttonText ?? "",
                style:
                    AppTextStyles.style16WhiteW500.copyWith(color: textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
