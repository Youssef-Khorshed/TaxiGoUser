// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/app_custom_widgets/custom_app_bottom.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/map_cubit/mapCubit.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/map_cubit/mapState.dart';
import 'package:taxi_go_user_version/Features/Map/Data/model/get_active_ride/get_active_ride.dart';

// ignore: must_be_immutable
class RequestButtons extends StatelessWidget {
  GetActiveRide nearbyRideRequest;

  RequestButtons({
    super.key,
    required this.nearbyRideRequest,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapsCubit, MapsState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomAppBottom(
                onPressed: () {
                  Navigator.pop(context);
                },
                buttonText: "Cancel",
                buttonColor: Colors.white,
                textColor: Colors.red,
                borderColor: Colors.red,
              ),
            ),
            horizontalSpace(10.w),
            Expanded(
              child: CustomAppBottom(
                onPressed: () async {},
                buttonText: "Accept",
                buttonColor: AppColors.blueColor,
                textColor: AppColors.whiteColor,
              ),
            ),
          ],
        );
      },
    );
  }
}
