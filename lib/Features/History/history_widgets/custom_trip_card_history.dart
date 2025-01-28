// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Features/History/data/history_data_model.dart';
import 'package:taxi_go_user_version/Features/History/history_widgets/custom_build_trip_details_history.dart';

// ignore: must_be_immutable
class HistoryTripCard extends StatefulWidget {
  final void Function() onStarPressed;
  final void Function() onSavedPressed;
  final HistoryData historyData;
  final int index;

  const HistoryTripCard({
    super.key,
    required this.onStarPressed,
    required this.onSavedPressed,
    required this.historyData,
    required this.index,
  });

  @override
  State<HistoryTripCard> createState() => _HistoryTripCardState();
}

class _HistoryTripCardState extends State<HistoryTripCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shadowColor: AppColors.grayColor,
      color: AppColors.whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: AppColors.whiteColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    widget.onStarPressed;
                  },
                  icon: Icon(
                    widget.historyData.isFavorite == true
                        ? Icons.star
                        : Icons.star_border_outlined,
                    color: AppColors.amberColor,
                  ),
                ),
                IconButton(
                    onPressed: widget.onSavedPressed,
                    icon: Icon(
                      widget.historyData.isSaved == true
                          ? Icons.bookmark
                          : Icons.bookmark_add_outlined,
                      color: AppColors.blueColor,
                    ))
              ],
            ),
          ),
          CustomBuildTripDetails(
            historyData: widget.historyData,
            index: widget.index,
          ),
        ],
      ),
    );
  }
}
