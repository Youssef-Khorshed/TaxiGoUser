import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Features/History/data/history_data_model.dart';
import 'package:taxi_go_user_version/Features/History/history_widgets/custom_build_trip_details_history.dart';

// ignore: must_be_immutable
class TripCard extends StatelessWidget {
  final void Function() onStarPressed;
  final void Function() onSavedPressed;
  IconData? savedicon;
  IconData? favicon;
  final HistoryData historyData;

  TripCard({
    super.key,
    this.favicon,
    this.savedicon,
    required this.onStarPressed,
    required this.onSavedPressed,
    required this.historyData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shadowColor: AppColors.grayColor,
      color: AppColors.whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: AppColors.whiteColor2,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: onStarPressed,
                  icon: Icon(
                    favicon ?? Icons.star_border_outlined,
                    color: AppColors.amberColor,
                  ),
                ),
                IconButton(
                    onPressed: onSavedPressed,
                    icon: Icon(
                      savedicon ?? Icons.bookmark_add_outlined,
                      color: AppColors.blueColor,
                    ))
              ],
            ),
          ),
          CustomBuildTripDetails(
            historyData: historyData,
          ),
        ],
      ),
    );
  }
}
