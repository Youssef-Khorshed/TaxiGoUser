import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Core/Utils/enums/localization.dart';
import 'package:taxi_go_user_version/Core/Utils/localization/cubit/local_cubit.dart';
import 'package:taxi_go_user_version/Features/Profile/data/profile_model.dart';
import 'package:taxi_go_user_version/Features/Profile/profile_widgets/custom_chage_language_profile.dart';
import 'package:taxi_go_user_version/Features/Profile/profile_widgets/profile_image_widget.dart';
import 'package:taxi_go_user_version/Features/Profile/profile_widgets/profile_info_item.dart';

class ProfileInfoBody extends StatelessWidget {
  const ProfileInfoBody({super.key, required this.userInfo});
  final UserInfo userInfo;

  @override
  Widget build(BuildContext context) {
    bool isEnglish = LocalCubit.get(context).localizationThemeState ==
        LocalizationThemeState.en;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(spacing: 15.h, children: [
        verticalSpace(50.h),
        ProfileImageWidget(
          imagePath: userInfo.picture,
        ),
        Column(
          children: [
            AutoSizeText(
              userInfo.name ?? 'name',
              style: AppTextStyles.style20BlackW500
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            AutoSizeText(
              userInfo.phone!.startsWith('+')
                  ? '${userInfo.phone!.substring(1)}+'
                  : userInfo.phone!,
              style: AppTextStyles.style16DarkgrayW500
                  .copyWith(color: AppColors.darkgrayColor.withAlpha(180)),
            ),
          ],
        ),
        verticalSpace(15.h),
        ProfileInfoItem(
          lable: AppLocalizations.of(context)!.gender,
          textInfo: userInfo.gender ?? 'male',
        ),
        ProfileInfoItem(
          lable: AppLocalizations.of(context)!.birth_day,
          textInfo: userInfo.birthday ?? '1 January 1999',
        ),
        ProfileInfoItem(
          lable: AppLocalizations.of(context)!.lang,
          textInfo: isEnglish
              ? AppLocalizations.of(context)!.english
              : AppLocalizations.of(context)!.arabic,
          toggle: const CustomChagelanguageProfile(),
        ),
        const Spacer()
      ]),
    );
  }
}
