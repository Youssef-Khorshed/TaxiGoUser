import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Assets/icons/app_icons.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Features/Chat/model_view/manger/chat/chat_cubit.dart';
import '../../../../Core/Utils/Network/Services/dependencyInjection.dart';
import '../../../../Core/Utils/Network/Services/services_locator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class MessageInputBar extends StatelessWidget {
  const MessageInputBar({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController messageController = TextEditingController();

    return BlocProvider(
      create: (context) => getIt<ChatCubit>(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: Row(
              children: [
                BlocBuilder<ChatCubit, ChatState>(
                  builder: (context, state) {
                    return Padding(
                      padding:  EdgeInsets.all(10.sp),
                      child: GestureDetector(
                        onTap: () {
                          String messageText = messageController.text.trim();

                          if (messageText.isNotEmpty) {
                            Map<String, dynamic> messageData = {
                              "message_type": "text",
                              "message": messageText,
                            };

                            ChatCubit.get(context).sendMessage(
                              messageText,
                              messageData,
                              "text",
                              context
                            );

                            messageController.clear();
                          }
                        },
                        child: Image.asset(AppIcons.send),
                      ),
                    );
                  },
                ),
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration:  InputDecoration(
                      hintText:  AppLocalizations.of(context)!.typeamessage,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 15.sp,
                        vertical: 10.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
