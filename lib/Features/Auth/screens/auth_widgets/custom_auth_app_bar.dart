import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import '../../../../Core/Utils/Colors/app_colors.dart';

class CustomAuthAppBar extends StatelessWidget {
  const CustomAuthAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              FontAwesomeIcons.angleLeft,
              color: Colors.black,
            ),
            horizontalSpace(5),
            AutoSizeText(
              "Back",
              style: AppTextStyles.style16WhiteW500
                  .copyWith(fontSize: 18, color: AppColors.blackColor),
            )
          ],
        ),
      ),
    );
  }
}
