import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../Core/Utils/Colors/app_colors.dart';

class CustomForgetPasswordInputOtpField extends StatelessWidget {
  final Function(String)? onCompleted;
  const CustomForgetPasswordInputOtpField({super.key, this.onCompleted});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
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
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      enableActiveFill: true,
      onCompleted: onCompleted,
    );
  }
}
