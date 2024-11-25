import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Features/Auth/screens/auth_widgets/custom_auth_app_bar.dart';
import 'package:taxi_go_user_version/Features/Auth/screens/auth_widgets/custom_log_in_bottoms.dart';
import 'package:taxi_go_user_version/Features/Auth/screens/auth_widgets/custom_log_in_form_field.dart';

class VerificationPhoneAndPasswordScreen extends StatelessWidget {
  const VerificationPhoneAndPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 80),
              child: const CustomAuthAppBar()),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  "Verifivation phone number",
                  style: AppTextStyles.style24WhiteW500.copyWith(
                    color: AppColors.blackColor,
                  ),
                ),
                verticalSpace(15),
                const CustomLogInFormField(
                  isPassword: false,
                  obscureText: false,
                  hintText: "Please Enter Your Phone Number",
                ),
                const Spacer(),
                CustomLogInBottoms(
                  onPressed: () {
                    // Navigator.pushNamed(
                    //     context, AppRoutes.forgetPasswordScreen);
                  },
                  text: "Send OTP",
                ),
              ],
            ),
          )),
    );
  }
}
