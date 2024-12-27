import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_go_user_version/Core/Utils/Assets/icons/app_icons.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:url_launcher/url_launcher.dart';

//import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

// ignore: must_be_immutable
class SnappingSheetTitleAccepted extends StatelessWidget {
  String captinPhoneNumber;
  String captinName;
  ImageProvider<Object>? backgroundImage;
  SnappingSheetTitleAccepted({
    super.key,
    this.backgroundImage,
    required this.captinPhoneNumber,
    required this.captinName,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 3.w),
          child: Divider(
            height: 25.h,
            thickness: 7,
            color: AppColors.kgrey,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 10.w,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 10.h,
          ),
          width: 100.w,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: backgroundImage,
                radius: 35.r,
              ),
              horizontalSpace(15.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    captinName,
                    style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  verticalSpace(10.h),
                  SvgPicture.asset(
                    AppIcons.carIcon,
                    height: 20.h,
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      _callPhoneNumber(captinPhoneNumber);
                    },
                    icon: SvgPicture.asset(
                      AppIcons.callIcon,
                      height: 30.h,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.chat);
                    },
                    icon: SvgPicture.asset(
                      AppIcons.messageIcon,
                      height: 30.h,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _callPhoneNumber(String phoneNumber) async {
    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );

    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }
}
