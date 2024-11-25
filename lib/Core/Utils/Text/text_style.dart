import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';

abstract class AppTextStyles {
  static TextStyle style24WhiteW500 = TextStyle(
    fontSize: 24,
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w500,
    fontFamily: GoogleFonts.cairo().fontFamily,
    height: 0,
  );

  static TextStyle style24BlackW500 = TextStyle(
    fontSize: 24,
    color: AppColors.blackColor,
    fontWeight: FontWeight.w500,
    fontFamily: GoogleFonts.cairo().fontFamily,
    height: 0,
  );

  static TextStyle style16WhiteW500 = TextStyle(
    fontSize: 16,
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w500,
    fontFamily: GoogleFonts.cairo().fontFamily,
    height: 0,
  );

  static TextStyle style14BlackW500 = TextStyle(
    fontSize: 14,
    color: AppColors.blackColor,
    fontWeight: FontWeight.w500,
    fontFamily: GoogleFonts.cairo().fontFamily,
    height: 0,
  );

  static TextStyle style20BlackW500 = TextStyle(
    fontSize: 20,
    color: AppColors.blackColor,
    fontWeight: FontWeight.w500,
    fontFamily: GoogleFonts.cairo().fontFamily,
    height: 0,
  );
}
