import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';

// ignore: must_be_immutable
class CustomAppBottom extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color bottomColor;
  Color? iconColor;

  final Color textColor;
  final bool hasIcon;
  CustomAppBottom({
    super.key,
    required this.onPressed,
    required this.text,
    required this.bottomColor,
    required this.hasIcon,
    required this.textColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(bottomColor),
                elevation: WidgetStateProperty.all(0),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                )),
            onPressed: onPressed,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  hasIcon
                      ? Icon(
                          Icons.my_location_outlined,
                          size: 20,
                          color: iconColor,
                        )
                      : const SizedBox.shrink(),
                  horizontalSpace(15),
                  AutoSizeText(
                    text,
                    style: AppTextStyles.style16WhiteW500
                        .copyWith(color: textColor),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
