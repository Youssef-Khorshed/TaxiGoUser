import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileInfoItem extends StatelessWidget {
  const ProfileInfoItem({
    super.key,
    required this.lable,
    this.toggle,
    required this.textInfo,
  });
  final String lable;
  final String textInfo;
  final Widget? toggle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Stack(clipBehavior: Clip.none, children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.darkgrayColor),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  textInfo,
                  style: AppTextStyles.style14DarkgrayW500.copyWith(
                      color: AppColors.darkgrayColor.withAlpha(200),
                      fontSize: 16.sp),
                ),
                toggle ?? SizedBox(),
              ],
            ),
          ),
        ),
        Positioned(
          top: -24,
          left: AppLocalizations.of(context)!.localeName == 'en' ? 16 : null,
          right: AppLocalizations.of(context)!.localeName == 'ar' ? 16 : null,
          child: Container(
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.whiteColor.withAlpha(200),
                  offset: const Offset(0, 0),
                  blurRadius: 2.0,
                ),
              ],
              color: AppColors.transparentColor,
              borderRadius: BorderRadius.circular(5000.0),
            ),
            child: Text(
              lable,
              style: AppTextStyles.style20BlackW500.copyWith(
                overflow: TextOverflow.fade,
              ),
            ),
          ),
        )
      ]),
    );
  }
}
