import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildRatingTripDetailsRow extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color iconColor;
  const BuildRatingTripDetailsRow(
      {super.key,
      required this.label,
      required this.icon,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      children: [
        Icon(icon, color: iconColor, size: size.height * 0.025.h),
        SizedBox(width: size.width * 0.03.w),
        AutoSizeText(
          label,
          style: TextStyle(fontSize: size.height * 0.02.h),
        ),
      ],
    );
  }
}
