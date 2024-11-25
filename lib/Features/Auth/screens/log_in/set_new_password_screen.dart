import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Features/Auth/screens/auth_widgets/custom_auth_app_bar.dart';
import 'package:taxi_go_user_version/Features/Auth/screens/auth_widgets/custom_log_in_bottoms.dart';
import 'package:taxi_go_user_version/Features/Auth/screens/auth_widgets/custom_log_in_form_field.dart';

class SetNewPasswordScreen extends StatelessWidget {
  const SetNewPasswordScreen({super.key});

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
                verticalSpace(10),
                AutoSizeText(
                  "Set Your New password ",
                  style: AppTextStyles.style24BlackW500,
                  textAlign: TextAlign.left,
                ),
                verticalSpace(10),
                const CustomLogInFormField(
                  isPassword: true,
                  obscureText: true,
                  hintText: "Enter Your New Password",
                ),
                const CustomLogInFormField(
                  isPassword: true,
                  obscureText: true,
                  hintText: "Confirm Password",
                ),
                const Spacer(),
                CustomLogInBottoms(
                  onPressed: () {},
                  text: "Save",
                ),
              ],
            )),
      ),
    );
  }
}
