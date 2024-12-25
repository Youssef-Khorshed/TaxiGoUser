import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Features/History/history_widgets/custom_driver_details_history.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomBuildTripDetails extends StatelessWidget {
  final bool hasIcon;
  const CustomBuildTripDetails({super.key, required this.hasIcon});

  @override
  Widget build(BuildContext context) {
    return TripDetails( hasIcon: hasIcon,);
  }


}
class TripDetails extends StatelessWidget {
    final bool hasIcon;

  const TripDetails({super.key, required this.hasIcon});

  @override
  Widget build(BuildContext context) {
   return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: EdgeInsets.only(
                top: hasIcon ? 50.w : 10  , bottom: 5.w , right: 10.h, left: 10.h),
            color: AppColors.whiteColor2,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                     Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 8.r,
                          backgroundColor: AppColors.blueColor,
                        ),
                        CircleAvatar(
                          radius: 3.r,
                          backgroundColor: AppColors.whiteColor,
                        ),
                      ],
                    ),
                    Container(
                      width: 1.w,
                      height: 23.h,
                      color: Colors.grey,
                    ),
                    const Icon(Icons.location_pin, color: Colors.red),
                  ],
                ),
                horizontalSpace(5),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          AutoSizeText(
                            AppLocalizations.of(context)!.state_park,
                            style: AppTextStyles.style18BlackW600,
                          ),
                          const Spacer(),
                          AutoSizeText(
                            '7:34 AM',
                            style: AppTextStyles.style16DarkgrayW500,
                          ),
                        ],
                      ),
                      verticalSpace(10),
                      Row(
                        children: [
                          AutoSizeText(
                            AppLocalizations.of(context)!.home,
                            style: AppTextStyles.style18BlackW600,
                          ),
                          const Spacer(),
                          AutoSizeText(
                            '7:48 AM',
                            style: AppTextStyles.style16DarkgrayW500,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )),
        Container(
          width: double.infinity,
          height: 1,
          color: AppColors.darkgrayColor,
        ),
        const CustomDriverdetailsHistory(),
      ],
    );
  }
}