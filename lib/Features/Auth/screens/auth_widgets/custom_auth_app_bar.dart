import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import '../../../../Core/Utils/Colors/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class CustomAuthAppBar extends StatelessWidget {
  const CustomAuthAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
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
              AppLocalizations.of(context)!.back,
              style: AppTextStyles.style16WhiteW500
                  .copyWith(fontSize: 18, color: AppColors.blackColor),
            )
          ],
        ),
      ),
    );
  }
}
