import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Features/History/history_widgets/custom_build_trip_details_history.dart';

class TripCard extends StatelessWidget {
  final String from;
  final String to;
  final String timeFrom;
  final String timeTo;
  final String driverName;
  final double rating;
  final String price;

  const TripCard({
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
                hasIcon: false,
              )),
            ],
          ),
        ),
      ],
    );
  }
}
