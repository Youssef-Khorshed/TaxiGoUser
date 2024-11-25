import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Features/Auth/screens/auth_widgets/custom_auth_bottom.dart';
import '../../../../Core/Utils/Text/text_style.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
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
              verticalSpace(30),
              AutoSizeText(
                "Phone verification",
                style: AppTextStyles.style24WhiteW500
                    .copyWith(color: Colors.black),
              ),
              AutoSizeText("Enter your OTP code",
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
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 53,
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
                  Text(
                    "Didn't receive code ?",
                    style: AppTextStyles.style16WhiteW500
                        .copyWith(color: AppColors.grayColor),
                  ),
                  horizontalSpace(5),
                  GestureDetector(
                    onTap: () {},
                    child: AutoSizeText("Resend again",
                        style: AppTextStyles.style16WhiteW500
                            .copyWith(color: AppColors.blueColor)),
                  ),
                ],
              ),
              const Spacer(),
              CustomAuthBottom(
                bottomText: 'Verify',
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
