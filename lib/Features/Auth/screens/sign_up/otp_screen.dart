import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import '../../../../Core/Utils/Text/text_style.dart';
import '../../../../Core/Utils/app_custom_widgets/custom_app_bottom.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Row(children: [
                  Icon(
                    FontAwesomeIcons.angleLeft,
                    color: Colors.black,
                    size: 25.sp,
                  ),
                  horizontalSpace(5),
                  AutoSizeText(AppLocalizations.of(context)!.back,
                      style: AppTextStyles.style20BlackW500)
                ]),
              ),
              verticalSpace(30),
              AutoSizeText(
                AppLocalizations.of(context)!.phone_verification,
                style: AppTextStyles.style24WhiteW500
                    .copyWith(color: Colors.black),
              ),
              AutoSizeText(AppLocalizations.of(context)!.enter_your_OTP_code,
                  style: AppTextStyles.style16WhiteW500
                      .copyWith(color: AppColors.grayColor)),
              verticalSpace(15),
              PinCodeTextField(
                appContext: context,
                length: 5,
                onChanged: (value) {},
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5.r),
                  fieldHeight: 50.h,
                  fieldWidth: 53.w,
                  activeFillColor: AppColors.whiteColor,
                  selectedFillColor: AppColors.whiteColor,
                  inactiveFillColor: AppColors.whiteColor,
                  activeColor: AppColors.blueColor,
                  selectedColor: AppColors.blueColor,
                  inactiveColor: AppColors.grayColor,
                ),
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
              verticalSpace(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    AppLocalizations.of(context)!.didnt_receive_the_code,
                    style: AppTextStyles.style16WhiteW500
                        .copyWith(color: AppColors.grayColor),
                  ),
                  horizontalSpace(5),
                  GestureDetector(
                    onTap: () {},
                    child: AutoSizeText(
                        AppLocalizations.of(context)!.resend_code,
                        style: AppTextStyles.style16WhiteW500
                            .copyWith(color: AppColors.blueColor)),
                  ),
                ],
              ),
              const Spacer(),
              CustomAppBottom(
                buttonText: AppLocalizations.of(context)!.confirm,
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.setPassword);
                },
              ),
              verticalSpace(15)
            ],
          ),
        ),
      ),
    );
  }
}
