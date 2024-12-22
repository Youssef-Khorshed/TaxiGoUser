import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';

class CustomAppBottom extends StatelessWidget {
  final String? buttonText;
  final VoidCallback onPressed;
  final Color? textColor, buttonColor, borderColor, iconColor;
  final Icon? icon;
  final double? borderCornerRadius;
  const CustomAppBottom({
    this.iconColor,
    this.borderColor,
    this.textColor,
    this.borderCornerRadius,
    this.buttonText,
    this.buttonColor,
    required this.onPressed,
    super.key,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderCornerRadius ?? 10),
              color: buttonColor ?? AppColors.blueColor,
              border: Border.all(color: borderColor ?? Colors.white, width: 1)),
          width: double.infinity,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon ?? const SizedBox(),
              verticalSpace(20),
              Center(
                child: AutoSizeText(
                  buttonText ?? "",
                  style:
                      AppTextStyles.style16WhiteW500.copyWith(color: textColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
