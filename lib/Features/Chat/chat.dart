import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Features/App/app_widgets/custom_ErrorAnimation.dart';
import 'model_view/chat_widgets/custom_message_input_bar_chat.dart';
import 'model_view/chat_widgets/custom_user_message_chat.dart';
import 'model_view/chat_widgets/locationmessage.dart';

class ChatScreen extends StatelessWidget {
  final TextEditingController _messageController = TextEditingController();

  ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor:            Colors.white,

        title:             Container(
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
              SizedBox(width: 5.w), // Add spacing

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
              SizedBox(width: 10.w), // Add spacing

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "captain_name",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Active Now",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Custom App Bar

            // Chat Messages
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Chat Messages (Sample Messages)
                    UserMessage(
                      message: "Where is your location?",
                      isSentByUser: false,
                      widthFactor: screenWidth * 0.9,
                    ),
                    UserMessage(
                      message: "I am here!",
                      isSentByUser: true,
                      widthFactor: screenWidth * 0.9,
                    ),
                    LocationMessage(
                      latitude: 25.276987,
                      longitude: 55.296249,
                      widthFactor: screenWidth * 0.7,
                      heightFactor: screenHeight * 0.2,
                      message: "This is my location now.",
                      isSentByUser: true,
                    ),
                  ],
                ),
              ),
            ),

            // Message Input Bar
            MessageInputBar(

            ),
          ],
        ),
      ),
    );
  }
}
