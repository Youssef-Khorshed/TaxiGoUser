import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../Core/Utils/Colors/app_colors.dart';
import '../../../../../Core/Utils/Routing/app_routes.dart';
import '../../../../../Core/Utils/Text/text_style.dart';
import '../../../../../Core/Utils/app_custom_widgets/custom_app_bottom.dart';
import '../../auth_widgets/custom_auth_app_bar.dart';
import '../../auth_widgets/custom_sms_message_box.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 80),
          child: const CustomAuthAppBar()),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AutoSizeText(
              AppLocalizations.of(context)!.forgotPassword,
              style: AppTextStyles.style24BlackW500,
            ),
            AutoSizeText(
              AppLocalizations.of(context)!.resetPasswordInstruction,
              style: AppTextStyles.style16WhiteW500
                  .copyWith(color: AppColors.grayColor),
              textAlign: TextAlign.center,
            ),
            verticalSpace(15),
            const CustomSmsMessageBox(),
            const Spacer(),
            CustomAppBottom(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.forgetPasswordSendOtp);
              },
              buttonText: AppLocalizations.of(context)!.continues,
            ),
          ],
        ),
      ),
    ));
  }
}
