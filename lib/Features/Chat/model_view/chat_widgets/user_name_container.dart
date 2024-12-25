import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../Core/Utils/Colors/app_colors.dart';
import '../../../../Core/Utils/Text/text_style.dart';

class UserNameContainer extends StatelessWidget {
  const UserNameContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(0.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.blackColor,
            ),
          ),
          horizontalSpace(5),
          Container(
            width: 40.w,
            height: 40.h,
            decoration: const BoxDecoration(
              color: Color(0xff969696),
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                  "https://firebasestorage.googleapis.com/v0/b/alexu-a9210.appspot.com/o/Vector%20(1).png?alt=media&token=e4d896a0-ec30-4944-b798-8ce0845d0bdb",
                ),
                fit: BoxFit.contain,
              ),
            ),
          ),
          horizontalSpace(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(AppLocalizations.of(context)!.captain_name,
                  style: AppTextStyles.taxidrivername),
              // Text(
              //   AppLocalizations.of(context)!.activeNow,
              //   style: TextStyle(
              //     fontSize: 10.sp,
              //     fontWeight: FontWeight.w400,
              //     fontFamily: GoogleFonts.cairo().fontFamily,
              //
              //     color: Color(0xff00D75A),
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
