import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';

class SnappingSheetTitleRequest extends StatelessWidget {
  const SnappingSheetTitleRequest({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        verticalSpace(10.h),
        Text(
          AppLocalizations.of(context)!.trip_started,
          style: TextStyle(
              color: const Color.fromARGB(255, 29, 26, 216),
              fontSize: 25.sp,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
