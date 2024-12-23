import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_go_user_version/Core/Utils/Assets/icons/app_icons.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';

class CancelButtonAccepted extends StatefulWidget {
  const CancelButtonAccepted({
    super.key,
    required this.onCancel,
    required this.width,
    required this.isAccepted,
  });

  final double width;
  final bool isAccepted;
  final VoidCallback onCancel;

  @override
  State<CancelButtonAccepted> createState() => _CancelButtonAcceptedState();
}

class _CancelButtonAcceptedState extends State<CancelButtonAccepted> {
  bool _isAccepted = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isAccepted = !_isAccepted;
          log('Cancellation state: $_isAccepted');
        });
        widget.onCancel();
      },
      child: Container(
        width: widget.width * 0.9,
        height: 70,
        decoration: BoxDecoration(
          color: AppColors.redColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppIcons.cancelIcon,
                width: 24.w,
                height: 24.h,
              ),
              verticalSpace(10.h),
              Text(
                "Cancel Your Booking",
                style: AppTextStyles.style20WhiteW600,
              )
            ],
          ),
        ),
      ),
    );
  }
}
