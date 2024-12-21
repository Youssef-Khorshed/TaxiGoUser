import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import '../../../../Core/Utils/Text/text_style.dart';
import '../../../../Core/Utils/app_custom_widgets/custom_app_bottom.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../App/app_widgets/custom_loading.dart';
import 'controller/otp_cubit/otp_cubit.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({super.key, this.phone});
  final String? phone;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String? code;

  late Timer _timer;

  int _seconds = 60;
  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _seconds = 60;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        setState(() {
          _seconds--;
        });
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    OtpCubit.get(context).controller?.dispose();

    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("${widget.phone}");
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
                    size: 25.r,
                  ),
                  horizontalSpace(5),
                  AutoSizeText(AppLocalizations.of(context)!.back,
                      style: AppTextStyles.style20BlackW500)
                ]),
              ),
              verticalSpace(30),
              AutoSizeText(
                widget.phone != null && widget.phone!.isNotEmpty
                    ? AppLocalizations.of(context)!.forgotPassword
                    : AppLocalizations.of(context)!.phoneVerification,
                style: AppTextStyles.style24WhiteW500
                    .copyWith(color: Colors.black),
              ),
              AutoSizeText(AppLocalizations.of(context)!.enterOTPCode,
                  style: AppTextStyles.style16WhiteW500
                      .copyWith(color: AppColors.grayColor)),
              verticalSpace(15),
              PinCodeTextField(
                appContext: context,
                length: 5,
                onChanged: (value) {
                  code = value;
                  print(value);
                },
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
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
                  Text(
                    AppLocalizations.of(context)!.did_not_receive_code,
                    style: AppTextStyles.style16WhiteW500
                        .copyWith(color: AppColors.grayColor),
                  ),
                  horizontalSpace(5),
                  _seconds > 0
                      ? Center(
                          child: Text(
                            ' $_seconds ${AppLocalizations.of(context)!.seconds}',
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            _startTimer();

                            if (widget.phone == "" || widget.phone == null) {
                              OtpCubit.get(context)
                                  .sendOtpEmailVerification(context);
                            } else {
                              OtpCubit.get(context)
                                  .forgetPassword(context, widget.phone!);
                            }
                          },
                          child: AutoSizeText(
                              AppLocalizations.of(context)!.resend_again,
                              style: AppTextStyles.style16WhiteW500
                                  .copyWith(color: AppColors.blueColor)),
                        ),
                ],
              ),
              const Spacer(),
              BlocConsumer<OtpCubit, OtpState>(
                listener: (context, state) {
                  if (state is VerifyAccountSuccess) {
                   if(widget.phone == "" || widget.phone == null){
                     Navigator.pushNamed(context, AppRoutes.setPassword);
                   }
                    else{
                      Navigator.pushNamed(context, AppRoutes.setNewPassword,arguments: widget.phone);
                    }
                  } else if (state is VerifyAccountFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          state.error ?? AppLocalizations.of(context)!.tryAgain,
                        ),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is VerifyAccountLoading) {
                    return const CustomLoading();
                  }
                  return CustomAppBottom(
                    buttonText: AppLocalizations.of(context)!.verify,
                    onPressed: () async {
                        Navigator.pushNamed(context, AppRoutes.setPassword,arguments: widget.phone);

                      if (widget.phone == "" || widget.phone == null) {
                        print("EEEEE${code}");
                        await OtpCubit.get(context)
                            .verifyAccount(context, int.parse(code ?? "0"));
                      } else {
                        await OtpCubit.get(context).forgotPasswordCheckCode(
                            context,
                            code: int.parse(code ?? "0"),
                            phone: widget.phone ?? "");
                      }
                    },
                  );
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
