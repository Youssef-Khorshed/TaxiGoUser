import 'package:flutter/material.dart';

import '../../../../Core/Utils/Colors/app_colors.dart';
import '../../../../Core/Utils/Text/text_style.dart';

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
          const CircleAvatar(
            radius: 30,
            backgroundColor: AppColors.blueColor,
            child: Icon(
              Icons.location_on,
              color: AppColors.whiteColor,
              size: 30,
            ),
          ),
          Text(
            'Enable your location',
            style: AppTextStyles.style18BlackW600,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      content: const Text(
        'Choose your location to start finding requests around you.',
        textAlign: TextAlign.center,
      ),
      actionsOverflowAlignment: OverflowBarAlignment.center,
      actions: [
        ElevatedButton(
          onPressed: onUseMyLocationPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.blueColor,
            minimumSize: const Size(double.infinity, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: Text(
            'Use my location',
            style: AppTextStyles.style16WhiteW500,
          ),
        ),
        TextButton(
          onPressed: onSkipPressed,
          child: Text(
            'Skip for now',
            style: AppTextStyles.style12GrayW400,
          ),
        ),
      ],
    );
  }
}
