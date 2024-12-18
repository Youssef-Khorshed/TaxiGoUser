// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:taxi_go_user_version/Core/Utils/Assets/lottie/lottie.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';

// ignore: must_be_immutable
class CustomErroranimation extends StatelessWidget {
  String errormessage;
  String lottie;

  CustomErroranimation({
    super.key,
    required this.errormessage,
    required this.lottie,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          children: [
            Lottie.asset(AppLottie.errorFailure,
                fit: BoxFit.cover, height: 300.h, width: 300.w),
            verticalSpace(10.h),
            const Text('An error occurred'),
          ],
        ),
      ),
    ));
  }
}
