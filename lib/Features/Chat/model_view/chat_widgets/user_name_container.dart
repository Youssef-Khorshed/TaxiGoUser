import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi_go_user_version/Features/Chat/model_view/manger/chat/chat_cubit.dart';

import '../../../../Core/Utils/Colors/app_colors.dart';
import '../../../../Core/Utils/Text/text_style.dart';

class UserNameContainer extends StatelessWidget {
  const UserNameContainer({super.key, required this.name, required this.image});
  final String name;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(5.0.sp),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              BlocProvider.of<ChatCubit>(context).stopMessageUpdateTimer();
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
            decoration: BoxDecoration(
              color: const Color(0xff969696),
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.contain,
              ),
            ),
          ),
          horizontalSpace(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: AppTextStyles.taxidrivername),
              Text(
                AppLocalizations.of(context)!.activeNow,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: GoogleFonts.cairo().fontFamily,
                  color: const Color(0xff00D75A),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
