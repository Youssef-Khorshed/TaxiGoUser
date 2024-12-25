import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Core/Utils/app_custom_widgets/custom_app_bottom.dart';
import 'package:taxi_go_user_version/Features/Auth/screens/auth_widgets/custom_auth_app_bar.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/customAppFormField.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({super.key});

  @override
  State<SetNewPasswordScreen> createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 80.h),
            child: const CustomAuthAppBar()),
        body: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                verticalSpace(10),
                AutoSizeText(
                  AppLocalizations.of(context)!.set_your_new_password,
                  style: AppTextStyles.style24BlackW500,
                  textAlign: TextAlign.left,
                ),
                verticalSpace(10),
                CustomTextFormFiled(
                  isPassword: true,
                  obscureText: true,
                  hintText: AppLocalizations.of(context)!.enter_your_new_password,
                  controller: passwordController,
                ),
                CustomTextFormFiled(
                  isPassword: true,
                  obscureText: true,
                  hintText: AppLocalizations.of(context)!.confirm_password,
                  controller: confirmPasswordController,
                ),
                const Spacer(),
                CustomAppBottom(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, AppRoutes.generalScreen);
                  },
                  buttonText: AppLocalizations.of(context)!.save_k,
                ),
              ],
            )),
      ),
    );
  }
}
