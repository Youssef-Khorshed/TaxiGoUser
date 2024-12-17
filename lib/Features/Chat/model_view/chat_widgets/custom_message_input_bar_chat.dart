import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class MessageInputBar extends StatelessWidget {
  const MessageInputBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController messageController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.grey, // Gray shadow
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
          borderRadius: BorderRadius.circular(30), // Rounded corners
          color: Colors.white, // Background color
        ),
        child: Row(
          children: [
            // Text Field
            Expanded(
              child: TextField(
                controller: messageController,
                decoration: InputDecoration(
                  hintText: "Type a message",
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                  border: InputBorder.none, // No border
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 15), // Internal padding
                ),
              ),
            ),

            // Send Icon Button
            Padding(
              padding: const EdgeInsets.all(.0),
              child: GestureDetector(
                onTap: () {
                  if (messageController.text.trim().isNotEmpty) {
                    print("Send: ${messageController.text.trim()}");
                  }
                },
                child: Icon(Icons.send, color: Colors.blue),
              ),
            ),

            // Microphone Icon Button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  print("Mic Pressed");
                },
                child: Icon(Icons.mic, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
