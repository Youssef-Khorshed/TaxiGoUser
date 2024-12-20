import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:taxi_go_user_version/Core/Utils/Assets/lottie/lottie.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';

class CustomSearchingDriverSheet extends StatelessWidget {
  const CustomSearchingDriverSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
        verticalSpace(10.h),
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
        verticalSpace(10.h),
        Lottie.asset(AppLottie.loading, height: 150.h, width: 150.w),
        Text(
          "...Loading",
          style: AppTextStyles.style18BlueBold,
        ),
        verticalSpace(20.h),
      ]),
    );
  }
}
