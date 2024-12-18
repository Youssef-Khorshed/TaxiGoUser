import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_go_user_version/Core/Utils/Assets/icons/app_icons.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
class MessageInputBar extends StatelessWidget {
  const MessageInputBar({super.key});
  @override
  Widget build(BuildContext context) {
    final TextEditingController messageController = TextEditingController();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
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
            borderRadius: BorderRadius.circular(30.sp),
            color: Colors.white,
          ),
          child: Row(
            children: [

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {
                    if (messageController.text.trim().isNotEmpty) {
                      print("Send: ${messageController.text.trim()}");
                    }
                  },
                  child: Image.asset(AppIcons.send),
                ),
              ),
      Expanded(
                child: TextField(
                  controller: messageController,
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.typeamessage,
                    hintStyle: AppTextStyles.sendmessgeformW500,
                    border: InputBorder.none,
                    contentPadding:  EdgeInsets.symmetric(
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
    );
  }
}