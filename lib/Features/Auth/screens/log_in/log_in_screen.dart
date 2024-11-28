import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Core/Utils/app_custom_widgets/custom_app_bottom.dart';
import 'package:taxi_go_user_version/Features/Auth/screens/auth_widgets/custom_auth_app_bar.dart';
import 'package:taxi_go_user_version/Features/Auth/screens/auth_widgets/custom_log_in_form_field.dart';

import '../../../../Core/Utils/app_custom_widgets/custom_app_form_field.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                verticalSpace(15),
                AutoSizeText(
                  "Log In",
                  style: AppTextStyles.style24WhiteW500
                      .copyWith(color: AppColors.blackColor),
                  textAlign: TextAlign.left,
                ),
                verticalSpace(15),
                 CustomAppFormField(
                  isPassword: false,
                  obscureText: false,
                  hintText: "Enter Your Phone Number",
                  controller: phoneController,
                  isPhone: true,
                ),
                 CustomAppFormField(
                  isPassword: true,
                  obscureText: true,
                  hintText: "Enter Your Password",
                  controller: passwordController,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.forgetPassword);
                  },
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: AutoSizeText(
                      "Forget password ?",
                      style: AppTextStyles.style16WhiteW500
                          .copyWith(color: AppColors.redColor, fontSize: 14),
                    ),
                  ),
                ),
                const Spacer(),
                CustomAppBottom(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, AppRoutes.loginOtpScreen);
                  },
                 buttonText: 'Log In',
                ),
                verticalSpace(10),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.signUp);
                  },
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Don\'t have an account ? ',
                        style: AppTextStyles.style16WhiteW500
                            .copyWith(color: AppColors.blackColor),
                        children: [
                          TextSpan(
                            text: 'Sign Up Now',
                            style: AppTextStyles.style16WhiteW500
                                .copyWith(color: AppColors.blueColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
