import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSplashBottom extends StatelessWidget {
  final String buttontext;
  final Function() onTap;
  final Color textcolor;
  final Color buttonColor;
  const CustomSplashBottom(
      {super.key,
      required this.buttontext,
      required this.onTap,
      required this.textcolor,
      required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: buttonColor,
              border: Border.all(color: Colors.white, width: 2)),
          width: double.infinity,
          height: 60,
          child: Center(
            child: AutoSizeText(
              buttontext,
              style: GoogleFonts.cairo(
                color: textcolor,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
