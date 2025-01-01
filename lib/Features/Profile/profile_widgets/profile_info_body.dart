import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    LocalizationThemeState.en;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(children: [
          verticalSpace(40.h),
          ProfileImageWidget(
            imagePath: userInfo.picture,
          ),
          verticalSpace(10.h),
          Column(
            children: [
              AutoSizeText(
                userInfo.name ?? 'name',
                style: AppTextStyles.style20BlackW500
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          verticalSpace(15.h),
          ProfileInfoItem(
            lable: AppLocalizations.of(context)!.phone_nubmer,
            textInfo: userInfo.phone!.startsWith('+')
                ? '${userInfo.phone!.substring(1)}+'
                : userInfo.phone!,
          ),
          verticalSpace(15.h),
          ProfileInfoItem(
            lable: AppLocalizations.of(context)!.address,
            textInfo: userInfo.address ?? '1 January 1999',
          ),
          verticalSpace(15.h),
          ProfileInfoItem(
            lable: AppLocalizations.of(context)!.balance,
            textInfo:
                '${userInfo.balance} ${AppLocalizations.of(context)!.iqd}',
          ),
          verticalSpace(15.h),
          ProfileInfoItem(
            lable: AppLocalizations.of(context)!.gender,
            textInfo: userInfo.gender ?? 'male',
          ),
          verticalSpace(15.h),
          ProfileInfoItem(
            lable: AppLocalizations.of(context)!.lang,
            textInfo: LocalCubit.get(context).localization == const Locale("en")
                ? AppLocalizations.of(context)!.english
                : AppLocalizations.of(context)!.arabic,
            toggle: const CustomChagelanguageProfile(),
          ),
        ]),
      ),
    );
  }
}
