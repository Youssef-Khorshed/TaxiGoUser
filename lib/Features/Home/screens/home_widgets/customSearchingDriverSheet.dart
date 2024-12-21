// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_OnGoingWayRider.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_bottomsheetStyle.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_countDownTimer.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/mapCubit.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/mapState.dart';

// ignore: must_be_immutable
class CustomSearchingDriverSheet extends StatelessWidget {
  String originTitle;
  String originSubTitle;
  String destinationTitle;
  String destinationSubTitle;
  String distance;
  String time;
  CustomSearchingDriverSheet({
    super.key,
    required this.originTitle,
    required this.originSubTitle,
    required this.destinationTitle,
    required this.destinationSubTitle,
    required this.distance,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<MapsCubit, MapsState>(
      listener: (context, state) {
        if (state is GetActiveRideRequestSuccess) {
          Navigator.pop(context);
          customBottomSheet(
              context: context,
              widget: CustomOngoingwayrider(
                  captinName: 'captinName',
                  captinImage: 'captinImage',
                  captinRating: '4.9',
                  originTitle: originTitle,
                  originSubTitle: originSubTitle,
                  destinationTitle: destinationTitle,
                  destinationSubTitle: destinationSubTitle,
                  distance: distance,
                  time: time));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.0.h),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.darkgrayColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
            height: 5.h,
            width: 134.w,
          ),
          verticalSpace(20.h),
          Row(
            children: [
              const Spacer(),
              Text(
                "Searching for a driver",
                style: AppTextStyles.style18BlueBold,
              ),
              const Spacer(),
            ],
          ),
          verticalSpace(20.h),
          const CustomCountdowntimer(),
          verticalSpace(20.h),
          Text(
            "...Loading",
            style: AppTextStyles.style18BlueBold,
          ),
          verticalSpace(20.h),
        ]),
      ),
    );
  }
}
