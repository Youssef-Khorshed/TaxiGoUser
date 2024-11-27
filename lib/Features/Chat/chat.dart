import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Features/Chat/chat_widgets/custom_messageInputBar_chat.dart';
import 'package:taxi_go_user_version/Features/Chat/chat_widgets/custom_userMessage_chat.dart';
import 'package:taxi_go_user_version/Features/Chat/chat_widgets/locationmessage.dart';

class ChatScreen extends StatelessWidget {
  final TextEditingController _messageController = TextEditingController();
  ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Screen dimensions
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Expanded(
                child: ListView(
              reverse: true,
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.03,
                vertical: screenHeight * 0.02,
              ),
              children: [
                UserMessage(
                  message: "Okay I am coming",
                  isSentByUser: false,
                  widthFactor: screenWidth * 0.7,
                ),
                LocationMessage(
                  latitude: 25.276987,
                  longitude: 55.296249,
                  widthFactor: screenWidth * 0.7,
                  heightFactor: screenHeight * 0.2,
                  message: "It's my location now",
                  isSentByUser: true,
                ),
              ],
            )),

            // Input Bar
            MessageInputBar(
              messageController: _messageController,
              onSendText: (message) {
                // Handle text message send
                print("Text Message: $message");
                _messageController.clear();
              },
              onSendLocation: () {
                // Handle location message send
                print("Send Location");
              },
            ),
          ],
        ),
      ),
    );
  }
}
