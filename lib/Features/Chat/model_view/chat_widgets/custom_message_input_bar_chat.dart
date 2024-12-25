import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import '../../../../Core/Utils/Assets/icons/app_icons.dart';
import '../manger/chat/chat_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MessageInputBar extends StatelessWidget {
  final ChatCubit chatCubit;

  const MessageInputBar({super.key, required this.chatCubit});

  @override
  Widget build(BuildContext context) {
    final TextEditingController messageController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(15.0),
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
            GestureDetector(
              child: Padding(
                padding: EdgeInsets.all(12.sp),
                child: Image.asset(AppIcons.send),
              ),
              onTap: () {
                final messageText = messageController.text.trim();
                if (messageText.isNotEmpty) {
                  chatCubit.sendMessage(
                    messageText,
                    {"message_type": "text", "message": messageText},
                    "text",
                    context,
                  );
                  messageController.clear();
                }
              },
            ),
            Container(
              height: 30.h,
              width: 2.w,
              decoration: BoxDecoration(
                color: AppColors.grayColor,
                borderRadius: BorderRadius.circular(30.r),
              ),
            ),
            Expanded(
              child: TextField(
                controller: messageController,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.typeamessage,
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
    );
  }
}
