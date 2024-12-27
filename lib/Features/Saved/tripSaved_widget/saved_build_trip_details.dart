import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Features/Saved/data/saved_data_model.dart';
import 'package:taxi_go_user_version/Features/Saved/tripSaved_widget/custom_driver_details_saved.dart';
import 'package:taxi_go_user_version/Features/Saved/tripSaved_widget/custom_saved_adress_row.dart';

class SavedBuildTripDetails extends StatelessWidget {
  const SavedBuildTripDetails({
    super.key,
    required this.savedData,
  });
  final SavedData savedData;

  @override
  Widget build(BuildContext context) {
    return _buildTripDetails();
  }

  Widget _buildTripDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding:
              EdgeInsets.only(top: 30, bottom: 5.h, right: 10.w, left: 10.w),
          color: AppColors.whiteColor,
          child: CustomSavedBuildAddressRow(
            savedRide: savedData.ride!,
            rideRequest: savedData.ride!.rideRequest!,
          ),
        ),
        Container(
          width: double.infinity,
          height: 1,
          color: AppColors.grayColor,
        ),
        CustomDriverDetailsSaved(
          rate: savedData.ride?.rate ?? '4.5',
          price: savedData.ride?.total ?? '200',
          saveCaptain: savedData.ride!.saveCaptain!,
        ),
      ],
    );
  }
}
