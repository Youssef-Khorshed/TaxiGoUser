import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';

import '../../../../Core/Utils/Colors/app_colors.dart';
import '../../../../Core/Utils/Text/text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EnableLocationDialog extends StatelessWidget {
  final VoidCallback onUseMyLocationPressed;
  final VoidCallback onSkipPressed;

  const EnableLocationDialog({
    super.key,
    required this.onUseMyLocationPressed,
    required this.onSkipPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      title: Column(
        children: [
          CircleAvatar(
            radius: 30.w,
            backgroundColor: AppColors.blueColor,
            child: Icon(
              Icons.location_on,
              color: AppColors.whiteColor,
              size: 30.r,
            ),
          ),
          verticalSpace(10.h),
          Text(
            AppLocalizations.of(context)!.enable_location,
            style: AppTextStyles.style18BlackW600,
            textAlign: TextAlign.center,
          ),
          Text(
            AppLocalizations.of(context)!.chose_your_location_to_start,
            style: AppTextStyles.style14GrayW500,
            textAlign: TextAlign.center,
          )
        ],
      ),
      actionsOverflowAlignment: OverflowBarAlignment.center,
      actions: [
        ElevatedButton(
          onPressed: onUseMyLocationPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.blueColor,
            minimumSize: Size(double.infinity, 48.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0.r),
            ),
          ),
          child: Text(
            AppLocalizations.of(context)!.use_my_location,
            style: AppTextStyles.style16WhiteW500,
          ),
        ),
        // TextButton(
        //   onPressed: onSkipPressed,
        //   child: Text(
        //     'Skip for now',
        //     style: AppTextStyles.style12GrayW400,
        //   ),
        // ),
      ],
    );
  }
}
