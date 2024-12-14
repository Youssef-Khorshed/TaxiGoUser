import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Features/Auth/screens/auth_widgets/custom_auth_app_bar.dart';
import 'package:taxi_go_user_version/Features/Auth/screens/auth_widgets/custom_log_in_form_field.dart';

import '../../../../Core/Utils/app_custom_widgets/custom_app_bottom.dart';
import '../../../../Core/Utils/app_custom_widgets/custom_app_form_field.dart';

class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({super.key});

  @override
  State<SetNewPasswordScreen> createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
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
                 CustomAppFormField(
                  isPassword: true,
                  obscureText: true,
                  hintText: "Enter Your New Password",
                  controller: passwordController,
                ),
                 CustomAppFormField(
                  isPassword: true,
                  obscureText: true,
                  hintText: "Confirm Password",
                  controller: confirmPasswordController,
                ),
                const Spacer(),
                CustomAppBottom(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, AppRoutes.generalScreen);
                  },
                  buttonText: "Save",
                ),
              ],
            )),
      ),
    );
  }
}
