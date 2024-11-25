import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Features/Auth/screens/auth_widgets/custom_auth_app_bar.dart';
import 'package:taxi_go_user_version/Features/Auth/screens/auth_widgets/custom_log_in_bottoms.dart';
import 'package:taxi_go_user_version/Features/Auth/screens/auth_widgets/custom_sms_message_box.dart';

import '../../../../Core/Utils/Colors/app_colors.dart';
import '../../../../Core/Utils/Text/text_style.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 80),
          child: const CustomAuthAppBar()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AutoSizeText(
              "Forget Password",
              style: AppTextStyles.style24BlackW500,
            ),
            AutoSizeText(
              "Select which contact details should we use to reset your password",
              style: AppTextStyles.style16WhiteW500
                  .copyWith(color: AppColors.grayColor),
              textAlign: TextAlign.center,
            ),
            verticalSpace(15),
            const CustomSmsMessageBox(),
            const Spacer(),
            CustomLogInBottoms(
              onPressed: () {
                // Navigator.pushNamed(context, AppRoutes.otpForgetPasswordScreen);
              },
              text: "Continue",
            ),
          ],
        ),
      ),
    ));
  }
}
