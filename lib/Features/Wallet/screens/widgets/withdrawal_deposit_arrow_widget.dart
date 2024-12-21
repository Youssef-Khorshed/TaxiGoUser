import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/Utils/Assets/images/app_images.dart';
import '../../../../Core/Utils/Colors/app_colors.dart';

class WithdrawalDepositArrowWidget extends StatelessWidget {
  final bool inside;
  const WithdrawalDepositArrowWidget({super.key, required this.inside});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: inside ? AppColors.lightGreen : AppColors.redColor,
      radius: 13.r,
      child: inside
          ? Image.asset(
              AppImages.arrowUpDoownImage,
              width: 18.w,
              height: 18.h,
              color: Colors.white,
            )
          : RotatedBox(
              quarterTurns: 2,
              child: Image.asset(
                AppImages.arrowUpDoownImage,
                width: 18.w,
                height: 18.h,
                color: Colors.white,
              ),
            ),
    );
  }
}
