import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';

class CustomAuthBottom extends StatelessWidget {
  final String bottomText;
  final VoidCallback onPressed;
  const CustomAuthBottom({
    super.key,
    required this.bottomText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GestureDetector(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.blueColor,
            ),
            width: double.infinity,
            height: 55,
            child: Center(
              child: AutoSizeText(
                bottomText,
                style: AppTextStyles.style16WhiteW500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
