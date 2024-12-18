import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Features/Auth/screens/auth_widgets/custom_auth_app_bar.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/customAppFormField.dart';
import '../../../../Core/Utils/Routing/app_routes.dart';
import '../../../../Core/Utils/app_custom_widgets/custom_app_bottom.dart';

class VerificationPhoneAndPasswordScreen extends StatefulWidget {
  const VerificationPhoneAndPasswordScreen({super.key});

  @override
  State<VerificationPhoneAndPasswordScreen> createState() =>
      _VerificationPhoneAndPasswordScreenState();
}

class _VerificationPhoneAndPasswordScreenState
    extends State<VerificationPhoneAndPasswordScreen> {
  final TextEditingController verificationPhoneController =
      TextEditingController();

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
                CustomTextFormFiled(
                  isPassword: false,
                  obscureText: false,
                  hintText: "Please Enter Your Phone Number",
                  controller: verificationPhoneController,
                  keyboardType: TextInputType.number,
                ),
                const Spacer(),
                CustomAppBottom(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.generalScreen,
                    );
                  },
                  buttonText: "Send OTP",
                ),
              ],
            ),
          )),
    );
  }
}
