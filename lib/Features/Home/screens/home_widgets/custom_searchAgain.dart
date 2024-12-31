// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Core/Utils/app_custom_widgets/custom_app_bottom.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/customSearchingDriverSheet.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_bottomsheetStyle.dart';

class CustomSearchagain extends StatefulWidget {
  String originTitle;
  String originSubTitle;
  String destinationTitle;
  String destinationSubTitle;
  String distance;
  String time;
  CustomSearchagain({
    super.key,
    required this.originTitle,
    required this.originSubTitle,
    required this.destinationTitle,
    required this.destinationSubTitle,
    required this.distance,
    required this.time,
  });

  @override
  State<CustomSearchagain> createState() => _CustomSearchagainState();
}

class _CustomSearchagainState extends State<CustomSearchagain> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 15.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Do You Want to Search Again',
            style: AppTextStyles.style14DarkgrayW500,
          ),
          verticalSpace(20.h),
          Row(
            children: [
              Expanded(
                child: CustomAppBottom(
                  borderCornerRadius: 40.r,
                  onPressed: () {
                    if (mounted) {
                      Navigator.pop(context);
                      customBottomSheet(
                          context: context,
                          widget: CustomSearchingDriverSheet(
                            originTitle: widget.originTitle,
                            originSubTitle: widget.originSubTitle,
                            destinationTitle: widget.destinationTitle,
                            destinationSubTitle: widget.destinationSubTitle,
                            distance: widget.distance,
                            time: widget.time,
                          ));
                    }
                  },
                  buttonText: 'Search',
                ),
              ),
              horizontalSpace(10.w),
              Expanded(
                child: CustomAppBottom(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  buttonColor: AppColors.whiteColor,
                  borderColor: AppColors.redColor,
                  borderCornerRadius: 40.r,
                  buttonText: AppLocalizations.of(context)!.cancel_k,
                  textColor: AppColors.redColor,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
