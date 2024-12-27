import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';

class ProfileInfoItem extends StatelessWidget {
  const ProfileInfoItem({
    super.key,
    required this.lable,
    this.toggle,
    required this.textInfo,
  });
  final String lable;
  final String textInfo;
  final Widget? toggle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Stack(clipBehavior: Clip.none, children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.darkgrayColor),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  textInfo,
                  style: AppTextStyles.style14DarkgrayW500.copyWith(
                    color: AppColors.darkgrayColor.withAlpha(200),
                  ),
                ),
                toggle ?? const SizedBox(),
              ],
            ),
          ),
        ),
        Positioned(
          top: -22,
          right: 16,
          child: Container(
            color: AppColors.whiteColor,
            child: AutoSizeText(
              lable,
              style: AppTextStyles.style20BlackW500,
            ),
          ),
        )
      ]),
    );
  }
}
