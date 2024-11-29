// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Features/Profile/profile_widgets/custom_bottom_sheet_profile.dart';

// ignore: must_be_immutable
class CustomRawProfile extends StatefulWidget {
  String title;
  String content;
  CustomRawProfile({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  State<CustomRawProfile> createState() => _CustomRawProfileState();
}

class _CustomRawProfileState extends State<CustomRawProfile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AutoSizeText(
          widget.title,
          style: AppTextStyles.style24BlackW500,
        ),
        const Spacer(),
        AutoSizeText(
          widget.content,
          style: MediaQuery.of(context).size.shortestSide >= 600
              ? AppTextStyles.style24DarkgrayW500
              : AppTextStyles.style16DarkgrayW500,
        ),
        IconButton(
            onPressed: () {
              widget.title == 'Language'
                  ? customProfileBottomsheet(context)
                  : null;
            },
            color: AppColors.darkgrayColor,
            icon: const Icon(Icons.arrow_forward_ios_sharp))
      ],
    );
  }
}
