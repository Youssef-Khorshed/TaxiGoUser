import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Features/notification/data/model/notification_model/datum.dart';
import '../../../../Core/Utils/Colors/app_colors.dart';
import '../../../../Core/Utils/Text/text_style.dart';

class NotificationItemWidget extends StatelessWidget {
  final Datum index;
  const NotificationItemWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 7.h),
      child: Card(
        elevation: 1,
        shadowColor: AppColors.blackColor,
        color: Colors.grey.shade100,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 5.h),
          margin: EdgeInsets.symmetric(horizontal: 5.w),
          width: double.infinity,
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      AutoSizeText(
                        index.title!,
                        style: AppTextStyles.style16BlackW600,
                      ),
                      horizontalSpace(15.w),
                      AutoSizeText(
                        index.createdAt!.hour.toString(),
                        style: AppTextStyles.style14BlackW500,
                      ),
                    ],
                  ),
                  AutoSizeText(
                    index.body!,
                    style: AppTextStyles.style14BlackW500,
                  ),
                ],
              ),
              const Spacer(),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(15)),
                  padding: EdgeInsets.all(10.w),
                  child: const CircleAvatar(
                    backgroundColor: AppColors.whiteColor,
                    child: Icon(Icons.notifications_active),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
