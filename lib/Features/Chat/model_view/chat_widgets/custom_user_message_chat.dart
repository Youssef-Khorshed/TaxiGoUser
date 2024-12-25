import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';

class UserMessage extends StatelessWidget {
  final String message;
  final String userType;
  final double widthFactor;
  final String time;

  const UserMessage({
    super.key,
    required this.message,
    required this.userType,
    required this.widthFactor,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    final isCaptain = userType == "captain";

    return Align(
      alignment: isCaptain ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.h),
        padding: EdgeInsets.all(10.r),
        constraints: BoxConstraints(
          maxWidth: widthFactor,
        ),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              blurRadius: 10,
              spreadRadius: 0,
              offset: Offset(0, 4),
              color: AppColors.grayColor,
            ),
          ],
          color: isCaptain ? AppColors.whiteColor : AppColors.blueColor,
          borderRadius: BorderRadius.only(
            bottomLeft: isCaptain ? Radius.zero : Radius.circular(16.sp),
            bottomRight: isCaptain ? Radius.circular(16.sp) : Radius.zero,
            topLeft: Radius.circular(16.sp),
            topRight: Radius.circular(16.sp),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message,
              maxLines: 1000,
              style: AppTextStyles.style14BlackW500.copyWith(
                color: isCaptain ? AppColors.blackColor : AppColors.whiteColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.r),
              child: Text(extractHourMinuteWithPeriod(time),
                  style: AppTextStyles.style12GrayW400),
            )
          ],
        ),
      ),
    );
  }
}

String extractHourMinuteWithPeriod(String apiTime) {
  try {
    // تحويل النص إلى كائن DateTime
    DateTime dateTime = DateTime.parse(apiTime);
    // استخراج الساعة والدقيقة
    int hour = dateTime.hour;
    String minute = dateTime.minute
        .toString()
        .padLeft(2, '0'); // إضافة صفر إذا كانت الدقيقة أقل من 10
    String period = hour >= 12 ? "PM" : "AM"; // تحديد الفترة الزمنية

    // تحويل الساعة إلى صيغة 12 ساعة
    hour = hour % 12 == 0 ? 12 : hour % 12;

    // تنسيق النتيجة
    String formattedHour =
        hour.toString().padLeft(2, '0'); // إضافة صفر إذا كانت الساعة أقل من 10
    return "$formattedHour:$minute $period";
  } catch (e) {
    // في حالة وجود خطأ في النص
    return "Invalid time format";
  }
}
