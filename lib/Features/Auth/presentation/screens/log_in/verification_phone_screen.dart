import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../Core/Utils/Routing/app_routes.dart';
import '../../../../../Core/Utils/app_custom_widgets/custom_app_bottom.dart';
import '../../../../../Core/Utils/app_custom_widgets/custom_app_form_field.dart';
import '../../../../../Core/Utils/validation.dart';
import '../../../../App/app_widgets/custom_loading.dart';
import '../../controller/otp_cubit/otp_cubit.dart';

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
          body: Form(
        key: OtpCubit.get(context).formKey,
        autovalidateMode: OtpCubit.get(context).autovalidateMode,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(30.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
              verticalSpace(30.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                child: Text(
                  AppLocalizations.of(context)!.phoneVerification,
                  style: AppTextStyles.style24WhiteW500.copyWith(
                    color: AppColors.blackColor,
                  ),
                ),
              ),
              verticalSpace(15.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0.w),
                child: CustomAppFormField(
                  hintStyle: AppTextStyles.style14BlackW500,
                  controller: OtpCubit.get(context).controller,
                  validator: (value) {
                    return Validation.validatePhone(value, context);
                  },
                  isPassword: false,
                  obscureText: false,
                  hintText: AppLocalizations.of(context)!.your_mobile_number,
                  isPhone: true,
                  isNumbers: true,
                ),
              ),
              const Spacer(),
              BlocConsumer<OtpCubit, OtpState>(
                listener: (context, state) {
                  if (state is ForgetPassSuccess) {
                    Navigator.pushReplacementNamed(context, AppRoutes.otp,
                        arguments: OtpCubit.get(context).controller?.text);
                  } else if (state is ForgetPassFailure) {
                    Fluttertoast.showToast(
                        msg: state.error ?? AppLocalizations.of(context)!.error,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0.sp);
                  }
                },
                builder: (context, state) {
                  if (state is ForgetPassLoading) {
                    return const CustomLoading();
                  }
                  return CustomAppBottom(
                    onPressed: () async {
                      // Navigator.pushNamed(
                      //   context,
                      //   AppRoutes.generalScreen,
                      // );
                      await OtpCubit.get(context)
                          .validateForgetPassword(context);
                      // setState(() {});
                      //   Navigator.pushNamed(context, AppRoutes.otp,arguments: OtpCubit.get(context).controller?.text
                      //   );
                    },
                    buttonText: AppLocalizations.of(context)!.send_otp,
                  );
                },
              ),
              horizontalSpace(30.h),
            ],
          ),
        ),
      )),
    );
  }
}
