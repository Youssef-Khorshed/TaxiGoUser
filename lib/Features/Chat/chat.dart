import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'model_view/chat_widgets/custom_message_input_bar_chat.dart';
import 'model_view/chat_widgets/custom_user_message_chat.dart';
import 'model_view/chat_widgets/locationmessage.dart';

import 'model_view/chat_widgets/share_location.dart';
import 'model_view/chat_widgets/user_name_container.dart';

class ChatScreen extends StatelessWidget {
  final TextEditingController _messageController = TextEditingController();

  // late PusherConfig pusherConfig;
  // initilizeRoom(roomID) async {
  //   pusherConfig = PusherConfig();
  //
  //   pusherConfig.initPusher(
  //     onEvent,
  //     roomId: roomID,
  //   );
  // }
  // void onEvent(PusherEvent event) {
  //   log("event came: " + event.data.toString());
  //   try {
  //     log(event.eventName.toString());
  //     if (event.eventName == r"App\Events\PushChatMessageEvent") {
  //       log("here");
  //       Message? message;
  //       message = Message.fromJson(jsonDecode(event.data)["data"]);
  //
  //       chatDetailsModel!.messages!.add(message);
  //     }


  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }
  ChatScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const UserNameContainer(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const ShareLocation(),
                    verticalSpace(20.h),
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
                    UserMessage(
                      message: "سلام عليكم",
                      isSentByUser: false,
                      widthFactor: screenWidth * 0.9,
                    ),
                  ],
                ),
              ),
            ),
            const MessageInputBar(),
          ],
        ),
      ),
    );
  }
}
