import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Features/Saved/data/saved_data_model.dart';
import 'package:taxi_go_user_version/Features/Saved/tripSaved_widget/saved_build_trip_details.dart';

// ignore: must_be_immutable
class SavedTripCard extends StatelessWidget {
  final void Function() onSavedPressed;
  final SavedData savedData;

  const SavedTripCard({
    super.key,
    required this.onSavedPressed,
    required this.savedData,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Card(
          elevation: 4,
          shadowColor: AppColors.grayColor,
          color: AppColors.whiteColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Row(
            children: [
              Expanded(
                  child: SavedBuildTripDetails(
                savedData: savedData,
              )),
            ],
          ),
        ),
        Positioned(
          top: 5.h,
          left: 1.h,
          child: IconButton(
            onPressed: onSavedPressed,
            icon: const Icon(
              size: 20,
              Icons.bookmark,
              color: AppColors.blueColor,
            ),
          ),
        )
      ],
    );
  }
}
