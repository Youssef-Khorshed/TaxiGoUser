import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Features/HiringDriver/screens/hiring_widgets/custom_button_hiring.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomCancelbodyCancel extends StatefulWidget {
  const CustomCancelbodyCancel({super.key});

  @override
  State<CustomCancelbodyCancel> createState() => _CustomCancelbodyCancelState();
}

class _CustomCancelbodyCancelState extends State<CustomCancelbodyCancel> {
  int _selectedReason = 1; // Default selected reason index

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // Reason Selection Container
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(size.width * 0.05.w),
          decoration:  BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section Title
              Text(
                AppLocalizations.of(context)!.why_do_you_want_to_cancel,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: size.height * 0.022.sp,
                ),
              ),
              verticalSpace(size.height * 0.01),

              // Radio Buttons for Reasons
              _buildReasonOption(
                  1, AppLocalizations.of(context)!.i_dont_need_this_journey),
              _buildReasonOption(
                  2, AppLocalizations.of(context)!.i_want_to_change_details),
              _buildReasonOption(
                  3, AppLocalizations.of(context)!.driver_took_too_long),
              _buildReasonOption(4, AppLocalizations.of(context)!.other),
              verticalSpace(20),

              AppButton(
                text: AppLocalizations.of(context)!.send,
                height: size.height * 0.01.h,
                circlesize: 24,
                onPressed: () {
                  // Handle button press logic here
                },
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildReasonOption(int index, String title) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Radio<int>(
        value: index,
        groupValue: _selectedReason,
        activeColor: AppColors.blueColor,
        onChanged: (value) {
          setState(() {
            _selectedReason = value!;
          });
        },
      ),
      title: AutoSizeText(
        title,
        style: AppTextStyles.style16BlackW600,
      ),
    );
  }
}
