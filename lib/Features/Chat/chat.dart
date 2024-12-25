import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/services_locator.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Features/App/app_widgets/custom_loading.dart';
import 'package:taxi_go_user_version/Features/Chat/data/model/message_data.dart';
import 'package:taxi_go_user_version/Features/Chat/model_view/chat_widgets/custom_message_input_bar_chat.dart';
import 'package:taxi_go_user_version/Features/Chat/model_view/chat_widgets/custom_user_message_chat.dart';
import 'package:taxi_go_user_version/Features/Chat/model_view/chat_widgets/user_name_container.dart';
import 'package:taxi_go_user_version/Features/Chat/model_view/manger/chat/chat_cubit.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final ScrollController _scrollController = ScrollController();

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final chatCubit = getIt<ChatCubit>();

    chatCubit.getChatdata(context);
    chatCubit.startMessageUpdateTimer(
        context); // Start the timer to update messages every second

    return BlocProvider.value(
      value: chatCubit,
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Column(
          children: [
            verticalSpace(40.h),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: UserNameContainer(
                image:
                    "https://firebasestorage.googleapis.com/v0/b/alexu-a9210.appspot.com/o/Vector%20(1).png?alt=media&token=e4d896a0-ec30-4944-b798-8ce0845d0bdb",
                name: "Ahmed Saaid",
              ),
            ),
            BlocConsumer<ChatCubit, ChatState>(
              listener: (context, state) {
                if (state is Chatupdate) {
                  // Scroll to bottom when messages are updated
                  _scrollToBottom();
                }
              },
              buildWhen: (previous, current) => current is Chatupdate,
              builder: (context, state) {
                if (state is ChatLoad) {
                  return const Center(child: CustomLoading());
                }

                if (state is Chaterror) {
                  return const Center(child: Text("Error"));
                }

                List<Message> messages =
                    BlocProvider.of<ChatCubit>(context).chats;
                return Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    padding: EdgeInsets.all(15.sp),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];

                      return UserMessage(
                        time: message.createdAt ?? "",
                        message: message.message ?? "",
                        userType: message.senderType,
                        widthFactor: screenWidth * 0.9,
                      );
                    },
                  ),
                );
              },
            ),
            MessageInputBar(chatCubit: chatCubit),
          ],
        ),
      ),
    );
  }
}
