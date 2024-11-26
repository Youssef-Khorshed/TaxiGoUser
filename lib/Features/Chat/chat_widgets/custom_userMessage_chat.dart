import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';

class UserMessage extends StatelessWidget {
  final String message;
  final bool isSentByUser;
  final double widthFactor;

  const UserMessage({
    super.key,
    required this.message,
    required this.isSentByUser,
    required this.widthFactor,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(10),
        constraints: BoxConstraints(maxWidth: widthFactor, maxHeight: 80),
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 0,
                  offset: Offset(0, 4),
                  color: AppColors.grayColor)
            ],
            color: isSentByUser ? AppColors.darkgrayColor : AppColors.blueColor,
            borderRadius: isSentByUser
                ? const BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16))
                : const BorderRadius.only(
                    bottomRight: Radius.circular(16),
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16))),
        child: AutoSizeText(message,
            maxLines: 2,
            style: isSentByUser
                ? AppTextStyles.style16BlackW600
                    .copyWith(color: AppColors.whiteColor)
                : AppTextStyles.style16BlackW600),
      ),
    );
  }
}
