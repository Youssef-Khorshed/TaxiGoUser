import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Core/Utils/app_custom_widgets/custom_app_bottom.dart';
import 'package:taxi_go_user_version/Features/Auth/screens/auth_widgets/custom_auth_app_bar.dart';
import '../../../../Core/Utils/app_custom_widgets/custom_app_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              preferredSize: Size(MediaQuery.of(context).size.width, 80.h),
              child: const CustomAuthAppBar()),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(15.h),
                AutoSizeText(
                  AppLocalizations.of(context)!.log_in,
                  style: AppTextStyles.style24WhiteW500
                      .copyWith(color: AppColors.blackColor),
                  textAlign: TextAlign.left,
                ),
                verticalSpace(15.h),
                CustomAppFormField(
                  isPassword: false,
                  obscureText: false,
                  hintText:
                      AppLocalizations.of(context)!.enter_your_phone_number,
                  controller: phoneController,
                  isPhone: true,
                ),
                verticalSpace(10.h),
                // CustomAppFormField(
                //   isPassword: true,
                //   obscureText: true,
                //   hintText: "Enter Your Password",
                //   controller: passwordController,
                // ),
                // InkWell(
                //   onTap: () {
                //     Navigator.pushNamed(context, AppRoutes.forgetPassword);
                //   },
                //   child: Align(
                //     alignment: Alignment.bottomRight,
                //     child: AutoSizeText(
                //       "Forget password ?",
                //       style: AppTextStyles.style16WhiteW500
                //           .copyWith(color: AppColors.redColor, fontSize: 14),
                //     ),
                //   ),
                // ),
                const Spacer(),
                CustomAppBottom(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, AppRoutes.loginOtpScreen);
                  },
                  buttonText: AppLocalizations.of(context)!.log_in,
                ),
                verticalSpace(10.h),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.signUp);
                  },
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        text:
                            AppLocalizations.of(context)!.dont_have_an_account,
                        style: AppTextStyles.style16WhiteW500
                            .copyWith(color: AppColors.blackColor),
                        children: [
                          TextSpan(
                            text: "  ",
                          ),
                          TextSpan(
                            text: AppLocalizations.of(context)!.sign_up,
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
