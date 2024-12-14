import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Core/Utils/app_custom_widgets/custom_drop_down.dart';
import 'package:taxi_go_user_version/Features/Auth/screens/auth_widgets/custom_auth_form_field.dart';
import 'package:taxi_go_user_version/Features/Auth/screens/auth_widgets/custom_phone_form_field.dart';
import 'package:taxi_go_user_version/Features/Auth/screens/auth_widgets/custom_terms_check_box.dart';
import '../../../../Core/Utils/app_custom_widgets/custom_app_form_field.dart';
import '../../../../Core/Utils/app_custom_widgets/custom_drop_down.dart';

import '../../../../Core/Utils/app_custom_widgets/custom_app_bottom.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final List<String> genders = ['Male', 'Female'];
  bool _isChecked = false;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Row(children: [
                    const Icon(
                      FontAwesomeIcons.angleLeft,
                      color: Colors.black,
                      size: 25,
                    ),
                    horizontalSpace(5),
                    AutoSizeText('Back', style: AppTextStyles.style20BlackW500)
                  ]),
                ),
                verticalSpace(10),
                AutoSizeText(
                  'Create Account',
                  style: AppTextStyles.style24WhiteW500
                      .copyWith(color: Colors.black),
                ),
                verticalSpace(10),
                 CustomAppFormField(
                  hintText: 'Name',
                  controller: nameController,
                ),
                verticalSpace(10),
                 CustomAppFormField(
                  hintText: 'Email',
                  controller: emailController,
                ),
                verticalSpace(10),
                CustomAppFormField(
                  hintText: 'phone',
                  controller: phoneController,
                  isPhone: true,
                ),
                verticalSpace(10),
                CustomDropDownFormField(
                  items: genders,
                  nameTextStyle: AppTextStyles.style14BlackW500,
                  name: 'Gender',
                ),
                verticalSpace(10),
                CustomTermsCheckBox(
                  isChecked: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                ),
                verticalSpace(20),
                CustomAppBottom(
                  buttonText: 'Sign Up',
                  onPressed: _isChecked
                      ? () {
                          Navigator.pushNamed(context, AppRoutes.otp);
                        }
                      : () {},
                ),
                verticalSpace(10),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Already have an account ? ',
                      style:
                          AppTextStyles.style20BlackW500.copyWith(fontSize: 16),
                      children: [
                        TextSpan(
                          text: 'Log in now',
                          style: AppTextStyles.style16WhiteW500
                              .copyWith(color: AppColors.blueColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, AppRoutes.logIn);
                            },
                        ),
                      ],
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
