import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';

class CustomLogInBottoms extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;

  const CustomLogInBottoms({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  State<CustomLogInBottoms> createState() => _CustomLogInBottomsState();
}

class _CustomLogInBottomsState extends State<CustomLogInBottoms> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.blueColor,
      ),
      child: FilledButton(
          style: ButtonStyle(
            backgroundColor:
                WidgetStateProperty.all<Color>(AppColors.blueColor),
          ),
          onPressed: widget.onPressed,
          child: AutoSizeText(
            widget.text,
            style: AppTextStyles.style16WhiteW500,
          )),
    );
  }
}
