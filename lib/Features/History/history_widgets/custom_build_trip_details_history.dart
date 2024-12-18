import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Features/History/history_widgets/custom_driver_details_history.dart';

class CustomBuildTripDetails extends StatelessWidget {
  final bool hasIcon;
  final String from;
  final String to;
  final String timeFrom;
  final String timeTo;
  final String driverName;
  final String rating;
  final String price;

  const CustomBuildTripDetails(
      {super.key,
      required this.hasIcon,
      required this.from,
      required this.to,
      required this.timeFrom,
      required this.timeTo,
      required this.driverName,
      required this.rating,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return _buildTripDetails();
  }

  Widget _buildTripDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: EdgeInsets.only(
                top: hasIcon ? 50.h : 10.h,
                bottom: 5.h,
                right: 10.w,
                left: 10.w),
            color: AppColors.whiteColor2,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 8,
                          backgroundColor: AppColors.blueColor,
                        ),
                        CircleAvatar(
                          radius: 3,
                          backgroundColor: AppColors.whiteColor,
                        ),
                      ],
                    ),
                    Container(
                      width: 1,
                      height: 23,
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
                            from,
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
                            to,
                            style: AppTextStyles.style18BlackW600,
                          ),
                          const Spacer(),
                          AutoSizeText(
                            '7:48 AM',
                            style: AppTextStyles.style16DarkgrayW500,
                          ),
                        ],
                      ),
                      verticalSpace(5),
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
        CustomDriverdetailsHistory(
          rate: rating,
          price: price,
        ),
      ],
    );
  }
}
