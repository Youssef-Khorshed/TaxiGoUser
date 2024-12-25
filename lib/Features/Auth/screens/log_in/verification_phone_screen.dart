import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Features/Auth/screens/auth_widgets/custom_auth_app_bar.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/customAppFormField.dart';
import '../../../../Core/Utils/Routing/app_routes.dart';
import '../../../../Core/Utils/app_custom_widgets/custom_app_bottom.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              preferredSize: Size(MediaQuery.of(context).size.width, 80.h),
              child: const CustomAuthAppBar()),
          body: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  AppLocalizations.of(context)!.phone_verification,
                  style: AppTextStyles.style24WhiteW500.copyWith(
                    color: AppColors.blackColor,
                  ),
                ),
                verticalSpace(15),
                CustomTextFormFiled(
                  isPassword: false,
                  obscureText: false,
                  hintText: AppLocalizations.of(context)!.enter_your_phone_number,
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
                  buttonText: AppLocalizations.of(context)!.send,
                ),
              ],
            ),
          )),
    );
  }
}
