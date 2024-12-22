import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/customAppFormField.dart';
import '../../../../Core/Utils/app_custom_widgets/custom_app_bottom.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SetPasswordScreenState createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
              verticalSpace(20),
              AutoSizeText(
                "Set password",
                style: AppTextStyles.style24WhiteW500
                    .copyWith(color: Colors.black),
              ),
              verticalSpace(15),
              CustomTextFormFiled(
                isPassword: true,
                obscureText: true,
                hintText: "Enter Your Password",
                controller: passwordController,
                textStyle: AppTextStyles.style12DarkgrayW400,
                hinttextStyle: AppTextStyles.style12DarkgrayW400,
              ),
              verticalSpace(10),
              CustomTextFormFiled(
                isPassword: true,
                obscureText: true,
                hintText: "Enter Your Password",
                controller: confirmPasswordController,
                textStyle: AppTextStyles.style12DarkgrayW400,
                hinttextStyle: AppTextStyles.style12DarkgrayW400,
              ),
              verticalSpace(10),
              const Spacer(),
              CustomAppBottom(
                  buttonText: 'Register',
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.setProfile);
                  }),
              verticalSpace(15),
            ],
          ),
        ),
      ),
    );
  }
}
