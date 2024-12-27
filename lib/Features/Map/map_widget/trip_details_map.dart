import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';

class TripDetailsMap extends StatelessWidget {
  const TripDetailsMap({
    super.key,
    required this.location,
    required this.address,
    required this.icon,
  });
  final String location;
  final String address;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: AutoSizeText(
        location,
        style: AppTextStyles.style16BlackW600,
      ),
      subtitle: AutoSizeText(
        address,
        style: AppTextStyles.style14DarkgrayW500,
      ),
      leading: Column(
        children: [
          SvgPicture.asset(
            icon,
            width: 25.w,
          ),
        ],
      ),
    );
  }
}
