import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';

class MessageInputBar extends StatelessWidget {
  final TextEditingController messageController;
  final Function(String) onSendText;
  final VoidCallback onSendLocation;

  const MessageInputBar({
    Key? key,
    required this.messageController,
    required this.onSendText,
    required this.onSendLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 0,
                  offset: Offset(0, 4),
                  color: AppColors.grayColor)
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: messageController,
                  decoration: InputDecoration(
                    hintText:
                        'Type Message', //AppLocalizations.of(context)!.typeMessage,
                    hintStyle: AppTextStyles.style14GrayW500,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          bottomLeft: Radius.circular(50)),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: AppColors.whiteColor,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                    suffixIcon: GestureDetector(
                      child: const Icon(Icons.send),
                      onTap: () {
                        if (messageController.text.trim().isNotEmpty) {
                          onSendText(messageController.text.trim());
                        }
                      },
                    ),
                  ),
                ),
              ),
              horizontalSpace(screenWidth * 0.002), // Responsive spacing
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                ),
                child: IconButton(
                  icon: const Icon(Icons.location_on, color: Colors.red),
                  onPressed: onSendLocation,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
