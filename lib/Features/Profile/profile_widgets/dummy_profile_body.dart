import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Features/Profile/profile_widgets/profile_image_widget.dart';
import 'package:taxi_go_user_version/Features/Profile/profile_widgets/profile_info_item.dart';

class DummyProfileBody extends StatelessWidget {
  const DummyProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(spacing: 15.h, children: [
        verticalSpace(50.h),
        Row(
          children: [
            ProfileImageWidget(),
            horizontalSpace(15),
            Column(
              children: [
                AutoSizeText(
                  'Hazem Mahmoud',
                  style: AppTextStyles.style20BlackW500
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                AutoSizeText(
                  'Hazem Mahmoud',
                  style: AppTextStyles.style16DarkgrayW500
                      .copyWith(color: AppColors.darkgrayColor.withAlpha(180)),
                ),
              ],
            )
          ],
        ),
        verticalSpace(15.h),
        ProfileInfoItem(
          lable: AppLocalizations.of(context)!.gender,
          textInfo: 'Hazem Mahmoud',
        ),
        ProfileInfoItem(
          lable: AppLocalizations.of(context)!.gender,
          textInfo: 'Hazem Mahmoud',
        ),
        ProfileInfoItem(
          lable: AppLocalizations.of(context)!.phone_nubmer,
          textInfo: 'Hazem Mahmoud',
        ),
        Spacer()
      ]),
    );
  }
}
