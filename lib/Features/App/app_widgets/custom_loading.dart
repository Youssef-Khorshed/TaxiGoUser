import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:taxi_go_user_version/Core/Utils/Assets/lottie/lottie.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Lottie.asset(
      AppLottie.loading,
      fit: BoxFit.cover,
      width: 50.r,
    ));
  }
}
