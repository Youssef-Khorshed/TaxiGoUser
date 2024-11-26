import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';

void CustomProfileBottomsheet(BuildContext context) {
  showBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) => Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            'Select Language',
            style: AppTextStyles.style18BlackW600
                .copyWith(color: AppColors.blackColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          verticalSpace(10), // Space between elements

          // Language options (Example of language selection)
          GestureDetector(
            onTap: () {
              // Handle tap on Arabic option
              print('Arabic selected');
              Navigator.pop(context); // Close bottom sheet after selection
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: AutoSizeText(
                'Ar',
                style: AppTextStyles.style18BlackW500
                    .copyWith(color: AppColors.blueColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.pop(context); // Close bottom sheet after selection
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: AutoSizeText(
                'EN',
                style: AppTextStyles.style18BlackW500
                    .copyWith(color: AppColors.blueColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
