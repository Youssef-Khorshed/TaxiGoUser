import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Features/Chat/chat_widgets/custom_messageInputBar_chat.dart';
import 'package:taxi_go_user_version/Features/Chat/chat_widgets/custom_userMessage_chat.dart';
import 'package:taxi_go_user_version/Features/Chat/chat_widgets/locationmessage.dart';

class ChatScreen extends StatelessWidget {
  final TextEditingController _messageController = TextEditingController();

  ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          'Chat Screen',
          style: AppTextStyles.style20WhiteW600,
        ),
        backgroundColor: AppColors.blueColor,
        centerTitle: true,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: AppColors.whiteColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: Column(
          children: [
            // Wrap the ListView in an Expanded or SingleChildScrollView
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Your Chat Messages
                    UserMessage(
                      message: "Where is your location ?",
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
                    // You can add more messages here
                  ],
                ),
              ),
            ),

            // The Message Input Bar
            MessageInputBar(
              messageController: _messageController,
              onSendText: (message) {
                // Handle text message send
                debugPrint("Text Message: $message");
                _messageController.clear();
              },
              onSendLocation: () {
                // Handle location message send
                debugPrint("Send Location");
              },
            ),
          ],
        ),
      ),
    );
  }
}
