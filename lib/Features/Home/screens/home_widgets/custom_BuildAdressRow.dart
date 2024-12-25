import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';

// ignore: must_be_immutable
class BuildAddressRow extends StatelessWidget {
  Icon icon;
  String title;
  String subtitle;
  bool? traling;
  String? distance;
  String? time;
  BuildAddressRow({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.traling,
    this.distance,
    this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        traling ?? true
            ? Row(
                children: [
                  Text(distance!, style: AppTextStyles.style12DarkgrayW400),
                ],
              )
            : const SizedBox(),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(title,
                textAlign: TextAlign.start,
                style: AppTextStyles.style16BlackW600),
            SizedBox(
                height: 20.h,
                width: 270.w,
                child: Text(subtitle,
                    textAlign: TextAlign.end,
                    style: AppTextStyles.style14GrayW500)),
          ],
        ),
        icon
      ],
    );
  }
}
