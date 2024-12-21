// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';

// ignore: must_be_immutable
class CustomButtonHiring extends StatelessWidget {
  String text;
  double height;
  double? width;
  double circlesize;
  void Function()? onPressed;
  CustomButtonHiring({
    super.key,
    required this.text,
    required this.height,
    this.onPressed,
    this.width,
    required this.circlesize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.blueColor,
          padding: EdgeInsets.symmetric(vertical: height),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(circlesize),
          ),
        ),
        child: AutoSizeText(
          text,
          style: AppTextStyles.style16WhiteW500,
        ),
      ),
    );
  }
}
