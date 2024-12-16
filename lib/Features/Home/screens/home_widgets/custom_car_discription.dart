import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/Utils/Colors/app_colors.dart';
import '../../../../Core/Utils/Text/text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomCarDiscription extends StatelessWidget {
  const CustomCarDiscription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.car_repair,
          color: AppColors.darkgrayColor,
          size: 35.r,
        ),
        AutoSizeText(
          "${AppLocalizations.of(context)!.car} | ${AppLocalizations.of(context)!.description}",
          style: AppTextStyles.style14GrayW500,
        )
      ],
    );
  }
}
