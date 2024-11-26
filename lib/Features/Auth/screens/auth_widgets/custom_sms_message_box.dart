import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import '../../../../../Core/Utils/Colors/app_colors.dart';

class CustomSmsMessageBox extends StatelessWidget {
  const CustomSmsMessageBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.blueColor, width: 1),
          borderRadius: BorderRadius.circular(6),
          color: AppColors.whiteColor),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            child: Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.blueColor, width: 1.5),
                color: AppColors.whiteColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(60),
                ),
              ),
              child: const SizedBox(
                height: 20,
                width: 20,
                child: Icon(
                  Icons.message,
                  color: AppColors.blueColor,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                " Via SMS",
                style: AppTextStyles.style16WhiteW500
                    .copyWith(color: AppColors.grayColor),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: AutoSizeText(
                  "***** ***790",
                  style: AppTextStyles.style14BlackW500
                      .copyWith(color: AppColors.blackColor),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
