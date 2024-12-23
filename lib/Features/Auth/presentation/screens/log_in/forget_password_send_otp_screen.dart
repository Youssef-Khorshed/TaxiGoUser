import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../Core/Utils/Routing/app_routes.dart';
import '../../../../../Core/Utils/Spacing/app_spacing.dart';
import '../../../../../Core/Utils/Text/text_style.dart';
import '../../../../../Core/Utils/app_custom_widgets/custom_app_bottom.dart';
import '../../auth_widgets/custom_auth_app_bar.dart';
import '../../auth_widgets/custom_forget_password_input_otp_field.dart';
class ForgetPasswordSendOtpScreen extends StatelessWidget {
  const ForgetPasswordSendOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 80),
            child: const CustomAuthAppBar()),
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
          child: Column(
            children: [
              verticalSpace(10),
              AutoSizeText(
                "Forget Password OTP",
                style: AppTextStyles.style24BlackW500,
              ),
              AutoSizeText(
               AppLocalizations.of(context)!.code_sent_to,
                style: AppTextStyles.style16WhiteW500
                    .copyWith(color: AppColors.grayColor),
                textAlign: TextAlign.center,
              ),
              verticalSpace(25),
              const CustomForgetPasswordInputOtpField(),
              verticalSpace(15),
              InkWell(
                onTap: () {},
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: AppLocalizations.of(context)!.didNotReceiveCode,
                      style: AppTextStyles.style16WhiteW500
                          .copyWith(color: AppColors.blackColor),
                      children: [
                        TextSpan(
                          text: AppLocalizations.of(context)!.resend_again,
                          style: AppTextStyles.style16WhiteW500
                              .copyWith(color: AppColors.blueColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              CustomAppBottom(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.setNewPassword);
                },
                buttonText:AppLocalizations.of(context)!.verify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
