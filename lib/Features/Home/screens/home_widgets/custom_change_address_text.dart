import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';

import '../../../../Core/Utils/Text/text_style.dart';

class CustomChangeAddressText extends StatelessWidget {
  final Color iconColor;
  final String title, subtitle, distance;
  const CustomChangeAddressText(
      {super.key,
      required this.iconColor,
      required this.title,
      required this.subtitle,
      required this.distance});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.location_on_rounded,
            color: iconColor,
          ),
          horizontalSpace(20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                title,
                style: AppTextStyles.style18BlackW600,
              ),
              AutoSizeText(
                subtitle,
                style: AppTextStyles.style14DarkgrayW500,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
