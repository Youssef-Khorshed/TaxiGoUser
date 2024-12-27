import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';

class CustomSnackBar extends StatelessWidget {
  final String message;
  final Color backgroundColor;
  final TextStyle textStyle;

  const CustomSnackBar({
    Key? key,
    required this.message,
    required this.backgroundColor,
    required this.textStyle,
  }) : super(key: key);

  void show(BuildContext context) {
    final SnackBar snackBar = SnackBar(
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          message,
          style: textStyle,
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.2, // Centered width
        vertical: MediaQuery.of(context).size.height * 0.4, // Centered height
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      duration: const Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
