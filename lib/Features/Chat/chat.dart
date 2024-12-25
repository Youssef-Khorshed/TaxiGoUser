import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Features/App/app_widgets/custom_loading.dart';
import 'package:taxi_go_user_version/Features/Chat/model_view/chat_widgets/custom_message_input_bar_chat.dart';
import 'package:taxi_go_user_version/Features/Chat/model_view/chat_widgets/share_location.dart';
import 'package:taxi_go_user_version/Features/Chat/model_view/manger/chat/chat_cubit.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/services_locator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'model_view/chat_widgets/custom_user_message_chat.dart';
import 'model_view/chat_widgets/locationmessage.dart';
import 'model_view/chat_widgets/user_name_container.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late final ChatCubit _chatCubit;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _chatCubit = getIt<ChatCubit>();
    _chatCubit.getChatdata(context);
    _chatCubit.listenForMessages();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocProvider.value(
      value: _chatCubit,
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          elevation: 0,
          scrolledUnderElevation: 0,
          title: const UserNameContainer(
            image:
                "https://firebasestorage.googleapis.com/v0/b/alexu-a9210.appspot.com/o/Vector%20(1).png?alt=media&token=e4d896a0-ec30-4944-b798-8ce0845d0bdb",
            name: "Ahmed Saaid",
          ),
        ),
        body: BlocBuilder<ChatCubit, ChatState>(
          builder: (context, state) {
            if (state is ChatLoad) {
              return const Center(child: CustomLoading());
            }
            if (state is Chaterror) {
              return const Center(child: Text("Error"));
            }
            if (state is Chatsuccful) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _scrollController.animateTo(
                  _scrollController.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              });

              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      controller: _scrollController,
                      padding: EdgeInsets.all(15.sp),
                      itemCount: state.messages.length,
                      itemBuilder: (context, index) {
                        final message = state.messages[index];
                        if (message.messageType == "location") {
                          return LocationMessage(
                            latitude: 25.276987,
                            longitude: 55.296249,
                            widthFactor: screenWidth * 0.7,
                            heightFactor: screenHeight * 0.2,
                            usertype: message.senderType,
                            message: message.message ?? "",
                          );
                        }
                        return UserMessage(
                          time: message.createdAt ?? "",
                          message: message.message ?? "",
                          userType: message.senderType,
                          widthFactor: screenWidth * 0.9,
                        );
                      },
                    ),
                  ),
                  MessageInputBar(chatCubit: _chatCubit),
                ],
              );
            }

            return Center(
                child:
                    Text(AppLocalizations.of(context)!.start_a_conversation));
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _chatCubit.close();
    super.dispose();
  }
}
