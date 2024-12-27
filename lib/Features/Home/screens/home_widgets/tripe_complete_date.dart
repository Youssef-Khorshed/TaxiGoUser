import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Features/Home/data/models/ride_complete_model/ride_complete_details_model.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_BuildAdressRowPayment.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/payments_details.dart';

class TripeCompleteDate extends StatelessWidget {
  const TripeCompleteDate({
    super.key,
    required this.rideCompleteDetailsModel,
  });
  final RideCompleteDetailsModel rideCompleteDetailsModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(30.h),
        BuildAddressRowUpdated(
          langFrom: rideCompleteDetailsModel.lngFrom ?? '',
          lateFrom: rideCompleteDetailsModel.latFrom ?? '',
          langTo: rideCompleteDetailsModel.lngTo ?? '',
          lateTo: rideCompleteDetailsModel.latTo ?? '',
          distance: rideCompleteDetailsModel.ride!.distance ?? 0.0,
        ),
        verticalSpace(30.h),
        PaymentsDetails(
            rideDetails: rideCompleteDetailsModel,
            size: MediaQuery.of(context).size),
      ],
    );
  }
}
