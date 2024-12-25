import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Features/History/history_widgets/custom_build_trip_details_history.dart';

class FavouriteCard extends StatelessWidget {
  final String from;
  final String to;
  final String timeFrom;
  final String timeTo;
  final String driverName;
  final double rating;
  final String price;

  const FavouriteCard({
    super.key,
    required this.from,
    required this.to,
    required this.timeFrom,
    required this.timeTo,
    required this.driverName,
    required this.rating,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Card(
          elevation: 2,
          shadowColor: AppColors.blackColor,
          color: AppColors.whiteColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          child: const Row(
            children: [
              Expanded(
                  child: CustomBuildTripDetails(
                hasIcon: true,
              )),
            ],
          ),
        ),
         Positioned(
          top: 5.h,
          right: 1.w,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: Icon(
              size: 30.sp,
              Icons.star_rate_rounded,
              color: AppColors.yellowColor,
            ),
          ),
        )
      ],
    );
  }
}
