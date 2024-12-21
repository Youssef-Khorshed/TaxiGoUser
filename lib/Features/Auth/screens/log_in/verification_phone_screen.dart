import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Features/Auth/screens/auth_widgets/custom_auth_app_bar.dart';
import '../../../../Core/Utils/Routing/app_routes.dart';
import '../../../../Core/Utils/app_custom_widgets/custom_app_bottom.dart';
import '../../../../Core/Utils/app_custom_widgets/custom_app_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../Core/Utils/validation.dart';
import '../../../App/app_widgets/custom_loading.dart';
import '../sign_up/controller/otp_cubit/otp_cubit.dart';
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
              preferredSize: Size(MediaQuery.of(context).size.width, 80),
              child: const CustomAuthAppBar()),
          body: Form(
            key: OtpCubit.get(context).formKey,
            autovalidateMode:OtpCubit.get(context).autovalidateMode ,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    AppLocalizations.of(context)!.phoneVerification,
                    style: AppTextStyles.style24WhiteW500.copyWith(
                      color: AppColors.blackColor,
                    ),
                  ),
                  verticalSpace(15),
                  CustomAppFormField(
                    controller:  OtpCubit.get(context).controller ,
                    validator: (value) {
                    return  Validation.validatePhone(value, context);
                    },

                    isPassword: false,
                    obscureText: false,
                    hintText: AppLocalizations.of(context)!.password_required,
                    isPhone: true,
                  ),
                  const Spacer(),
                  BlocConsumer<OtpCubit, OtpState>(
              listener: (context, state) {
                if(state is ForgetPassSuccess){
                  Navigator.pushNamed(context, AppRoutes.loginOtpScreen
                      //,arguments: OtpCubit.get(context).controller?.text
                      );

                }
                else if(state is ForgetPassFailure){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error??"Error")));
                }  },
              builder: (context, state) {
                if(state is ForgetPassLoading){
                  return CustomLoading();
                }
                return CustomAppBottom(
                    onPressed: () {
                      // Navigator.pushNamed(
                      //   context,
                      //   AppRoutes.generalScreen,
                      // );
                    //  OtpCubit.get(context).validateForgetPassword(context);
                      Navigator.pushNamed(context, AppRoutes.otp,arguments: OtpCubit.get(context).controller?.text
                      );
                    },
                    buttonText: AppLocalizations.of(context)!.send_otp,
                  );
              },
            ),
                ],
              ),
            ),
          )),
    );
  }
}
