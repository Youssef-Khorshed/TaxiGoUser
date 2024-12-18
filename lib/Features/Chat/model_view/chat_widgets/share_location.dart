import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_user_version/Core/Utils/Assets/icons/app_icons.dart';
import '../../../../Core/Utils/Colors/app_colors.dart';
import '../../../../Core/Utils/Spacing/app_spacing.dart';

class ShareLocation extends StatelessWidget {
  const ShareLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return                     Container(
      width: 158.w,
      height: 40.h,
      decoration: BoxDecoration(
        color: Color(0xffEEEEEE),
        borderRadius: BorderRadius.circular(20),

      ),
      alignment: Alignment.center,
      child: Directionality(
        textDirection: TextDirection.rtl,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(  AppLocalizations.of(context)!.sharelocation,style: TextStyle(
              color: AppColors.blackColor,
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
              fontFamily: GoogleFonts.cairo().fontFamily,

            ),),
            horizontalSpace(10.w),
            Image.asset(AppIcons.shareLocation),

          ],
        ),
      ),
    );
  }
}
