import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../Core/Utils/Colors/app_colors.dart';
import '../../../../Core/Utils/Text/text_style.dart';

class CustomRatingText extends StatelessWidget {
  const CustomRatingText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            "User Name",
            style: AppTextStyles.style18BlackW600,
          ),
          Row(
            children: [
              AutoSizeText(
                "4.5",
                style: AppTextStyles.style16GrayW500,
              ),
              Icon(
                Icons.star,
                color: AppColors.yellowColor,
                size: 16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
