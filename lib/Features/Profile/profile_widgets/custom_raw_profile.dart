// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';

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
          style: AppTextStyles.style24BlackW500.copyWith(fontSize: 20),
        ),
        const Spacer(),
        AutoSizeText(
          widget.content,
          style: MediaQuery.of(context).size.shortestSide >= 600
              ? AppTextStyles.style24DarkgrayW500
              : AppTextStyles.style16DarkgrayW500,
        ),
      ],
    );
  }
}
