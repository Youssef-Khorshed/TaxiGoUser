import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Features/Profile/profile_widgets/custom_chage_language_profile.dart';
import 'package:taxi_go_user_version/Features/Profile/profile_widgets/profile_image_widget.dart';
import 'package:taxi_go_user_version/Features/Profile/profile_widgets/profile_info_item.dart';

class DummyProfileBody extends StatelessWidget {
  const DummyProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(children: [
          verticalSpace(40.h),
          const ProfileImageWidget(),
          verticalSpace(10.h),
          Column(
            children: [
              AutoSizeText(
                'name',
                style: AppTextStyles.style20BlackW500
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    color: AppColors.amberColor,
                    size: 20,
                  ),
                  AutoSizeText(
                    '2.5',
                    style: AppTextStyles.style16DarkgrayW500.copyWith(
                        color: AppColors.darkgrayColor.withAlpha(180)),
                  ),
                ],
              ),
            ],
          ),
          verticalSpace(15.h),
          ProfileInfoItem(
            lable: AppLocalizations.of(context)!.phone_nubmer,
            textInfo: '',
          ),
          verticalSpace(15.h),
          ProfileInfoItem(
            lable: AppLocalizations.of(context)!.address,
            textInfo: '1 January 1999',
          ),
          verticalSpace(15.h),
          ProfileInfoItem(
            lable: AppLocalizations.of(context)!.balance,
            textInfo: '"391.78',
          ),
          verticalSpace(15.h),
          ProfileInfoItem(
            lable: AppLocalizations.of(context)!.gender,
            textInfo: 'male',
          ),
          verticalSpace(15.h),
          ProfileInfoItem(
            lable: AppLocalizations.of(context)!.lang,
            textInfo: 'englis',
            toggle: const CustomChagelanguageProfile(),
          ),
        ]),
      ),
    );
  }
}
