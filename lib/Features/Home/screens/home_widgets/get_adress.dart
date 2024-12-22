import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:taxi_go_user_version/Core/Utils/Assets/icons/app_icons.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/trip_details.dart';

class BuildAddressRow2 extends StatelessWidget {
  BuildAddressRow2({
    super.key,
    required this.originTitle,
    required this.originSubTitle,
    required this.destinationTitle,
    required this.destinationSubTitle,
    required this.distance,
  });

  final String originTitle;
  final String originSubTitle;
  final String destinationTitle;
  final String destinationSubTitle;
  final String distance;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TripDetailsMap(
            address: originTitle,
            location: originSubTitle,
            icon: AppIcons.iconsMapRed,
          ),
          TripDetailsMap(
            address: destinationTitle,
            location: destinationSubTitle,
            icon: AppIcons.iconsMapBlue,
          ),
        ],
      ),
      trailing: Text(
        "${distance} ",
        style: TextStyle(fontSize: 15.sp),
      ),
    );
  }
}

Widget simmerWidget(context) {
  return Column(
    children: [
      ListTile(
        title: Container(
          height: 15.h,
          width: 20.w,
          decoration: BoxDecoration(
              color: AppColors.grayColor,
              borderRadius: BorderRadius.circular(12.r)),
        ),
        subtitle: Container(
          height: 15.h,
          width: 50.w,
          decoration: BoxDecoration(
              color: AppColors.grayColor,
              borderRadius: BorderRadius.circular(12.r)),
        ),
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
              width: MediaQuery.of(context).size.width * .05,
              child: SvgPicture.asset(
                AppIcons.iconsMapBlue,
              ),
            ),
          ],
        ),
      ),
      horizontalSpace(5),
    ],
  );
}
