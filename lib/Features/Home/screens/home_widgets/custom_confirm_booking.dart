import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import '../../../../Core/Utils/Colors/app_colors.dart';
import '../../../../Core/Utils/Text/text_style.dart';
import '../../../../Core/Utils/app_custom_widgets/custom_app_bottom.dart';
import 'custom_change_address_text.dart';
import 'custom_rating_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomConfirmBooking extends StatelessWidget {
  const CustomConfirmBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.all(8.0.r),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 30.r,
                      backgroundColor: AppColors.grayColor,
                      child: Icon(
                        Icons.person_sharp,
                        color: AppColors.darkgrayColor,
                      ),
                    ),
                    const CustomRatingText(),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.all(8.0.r),
                      child: CircleAvatar(
                        maxRadius: 15,
                        backgroundColor: AppColors.lightGreen,
                        child: Icon(
                          Icons.phone_outlined,
                          color: AppColors.whiteColor,
                          size: 15.r,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.chat);
                      },
                      child: CircleAvatar(
                          maxRadius: 15.r,
                          backgroundColor: AppColors.blueColor,
                          child: Icon(
                            Icons.message_outlined,
                            color: AppColors.whiteColor,
                            size: 15.r,
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        verticalSpace(15.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              CustomChangeAddressText(
                title: AppLocalizations.of(context)!.current_location,
                subtitle: "2972 Westheimer Rd. Santa Ana, Illinois 85486",
                iconColor: AppColors.redColor,
                distance: "",
              ),
              verticalSpace(10),
              const CustomChangeAddressText(
                title: "Office",
                subtitle: "1901 Thornridge Cir. Shiloh, Hawaii 81063",
                iconColor: AppColors.blueColor,
                distance: "",
              ),
            ],
          ),
        ),
        verticalSpace(15.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                AutoSizeText(
                  AppLocalizations.of(context)!.distance,
                  style: AppTextStyles.style16BlackW600,
                ),
                verticalSpace(2),
                AutoSizeText(
                  "50 ${AppLocalizations.of(context)!.km}",
                  style: AppTextStyles.style14BlackW500,
                ),
              ],
            ),
            Column(
              children: [
                AutoSizeText(
                  AppLocalizations.of(context)!.time,
                  style: AppTextStyles.style16BlackW600,
                ),
                verticalSpace(2.h),
                AutoSizeText(
                  "10 ${AppLocalizations.of(context)!.min}",
                  style: AppTextStyles.style14BlackW500,
                ),
              ],
            ),
          ],
        ),
        verticalSpace(10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0.w),
          child: Row(
            children: [
              CustomAppBottom(
                  onPressed: () {},
                  buttonText: AppLocalizations.of(context)!.back,
                  buttonColor: AppColors.whiteColor,
                  hasIcon: false,
                  textColor: AppColors.redColor),
              CustomAppBottom(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.payment);
                  },
                  buttonText: AppLocalizations.of(context)!.confirm,
                  buttonColor: AppColors.blueColor,
                  hasIcon: false,
                  textColor: AppColors.whiteColor),
            ],
          ),
        ),
        verticalSpace(15.h),
      ],
    );
  }
}
