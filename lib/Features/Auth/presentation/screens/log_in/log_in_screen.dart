import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Core/Utils/app_custom_widgets/custom_app_bottom.dart';
import 'package:taxi_go_user_version/Core/Utils/validation.dart';
import 'package:taxi_go_user_version/Features/App/app_widgets/custom_loading.dart';
import '../../../../../Core/Utils/app_custom_widgets/custom_app_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../controller/login_cubit/login_cubit.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
        children: [
          Form(
            autovalidateMode: LoginCubit.get(context).loginAutoValidateMode,
            key: LoginCubit.get(context).loginFormKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(15.h),
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
                  verticalSpace(15.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                    child: AutoSizeText(
                      AppLocalizations.of(context)!.logIn,
                      style: AppTextStyles.style24WhiteW500
                          .copyWith(color: AppColors.blackColor),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  verticalSpace(15.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0.w),
                    child: Column(children: [
                      CustomAppFormField(
                        onTap: () {},
                        isPassword: false,
                        hintStyle: AppTextStyles.style14BlackW500,
                        obscureText: false,
                        hintText: AppLocalizations.of(context)!.phoneNumber,
                        controller:
                            LoginCubit.get(context).loginPhoneController,
                        validator: (p0) =>
                            Validation.validatePhone(p0, context),
                        isPhone: true,
                        isNumbers: true,
                      ),
                      verticalSpace(15.h),
                      CustomAppFormField(
                        hintStyle: AppTextStyles.style14BlackW500,
                        onTap: () {},
                        isPassword: true,
                        obscureText: true,
                        hintText:
                            AppLocalizations.of(context)!.password_required,
                        controller: LoginCubit.get(context).loginPassController,
                        validator: (p0) =>
                            Validation.validatePassword(p0, context),
                        isNumbers: false,
                      ),
                    ]),
                  ),

                  verticalSpace(10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, AppRoutes.verificationPhoneAndPassword);
                      },
                      child: Text(
                        AppLocalizations.of(context)!.forgotPassword,
                        style: AppTextStyles.style16WhiteW500.copyWith(
                            color: AppColors.redColor, fontSize: 14.sp),
                      ),
                    ),
                  ),
                  verticalSpace(MediaQuery.of(context).size.width / 1.7)

                  // const Spacer(),
                ],
              ),
            ),
          ),
            const Spacer(),
          BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginInSuccess) {
                LoginCubit.get(context).loginAutoValidateMode =
                    AutovalidateMode.disabled;
                LoginCubit.get(context).loginPhoneController.clear();
                LoginCubit.get(context).loginPassController.clear();
                Navigator.pushReplacementNamed(
                    context, AppRoutes.generalScreen);
              } else if (state is LoginInError) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.errorMessage)));
              }
            },
            builder: (context, state) {
              if (state is LoginInLoading) {
                return const CustomLoading();
              }
              return CustomAppBottom(
                width: MediaQuery.of(context).size.width * 0.9,
                textColor: AppColors.whiteColor,
                buttonColor: AppColors.blueColor,
                borderCornerRadius: 10.r,
                onPressed: () async {
                  await LoginCubit.get(context).loginValidate(context);
                  setState(() {});
                },
                buttonText: AppLocalizations.of(context)!.logIn,
              );
            },
          ),
          verticalSpace(10.h),
          InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context, AppRoutes.signUp);
            },
            child: Center(
              child: RichText(
                text: TextSpan(
                  text: AppLocalizations.of(context)!.dontHaveAccount,
                  style: AppTextStyles.style16WhiteW500.copyWith(
                    color: AppColors.blackColor,
                  ),
                  children: [
                    WidgetSpan(
                      child: SizedBox(width: 5.w),
                    ),
                    TextSpan(
                      text: AppLocalizations.of(context)!.signUp,
                      style: AppTextStyles.style16WhiteW500.copyWith(
                        color: AppColors.blueColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          verticalSpace(25.h),
        ],
      )),
    );
  }
}
