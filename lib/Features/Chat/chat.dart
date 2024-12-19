import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_go_user_version/Features/Chat/model_view/chat_widgets/locationmessage.dart';
import '../../Core/Utils/Network/Services/services_locator.dart';
import 'data/model/message_data.dart';
import 'model_view/chat_widgets/custom_message_input_bar_chat.dart';
import 'model_view/chat_widgets/custom_user_message_chat.dart';

import 'model_view/chat_widgets/share_location.dart';
import 'model_view/chat_widgets/user_name_container.dart';
import 'model_view/manger/chat/chat_cubit.dart';
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}
class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Message> messages = [];
  final int currentUser = 2;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => getIt<ChatCubit>()..getChatdata(context),
      child: Scaffold(
        appBar: AppBar(
          title: const UserNameContainer(),
        ),
        body: BlocBuilder<ChatCubit, ChatState>(
          builder: (context, state) {
            if (state is ChatLoad) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is Chatsuccful) {
              final messages = state.messages;

                return Column(
                  children: [
                    const ShareLocation(),
                    Expanded(
                      child: ListView.builder(
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          final message = messages[index];

                          if (message.messageType == "location") {
                            return LocationMessage(
                              latitude: double.parse(message.lat as String ),
                              longitude: double.parse(message.lng as String),
                              widthFactor: screenWidth * 0.7,
                              heightFactor: screenHeight * 0.2,
                              usertype: message.senderType,
                              message: message.message ?? "",
                            );
                          }

                          return UserMessage(
                            message: message.message ?? "",
                            userType: message.senderType,
                            widthFactor: screenWidth * 0.9,
                          );
                        },
                      ),
                    ),
                    const MessageInputBar(),
                  ],
                );
            }
            else {
              return const Center(
                child: Text("No messages yet"),
              );
            }
          }),
      ),
    );
  }
}