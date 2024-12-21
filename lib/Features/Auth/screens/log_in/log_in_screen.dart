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
import 'package:taxi_go_user_version/Features/Auth/screens/auth_widgets/custom_auth_app_bar.dart';
import 'package:taxi_go_user_version/Features/Auth/screens/sign_up/controller/login_cubit/login_cubit.dart';
import '../../../../Core/Utils/app_custom_widgets/custom_app_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 80),
              child: const CustomAuthAppBar()),
          body: Column(
            children: [
              Form(
                autovalidateMode: LoginCubit.get(context).loginAutoValidateMode,
                key: LoginCubit.get(context).loginFormKey,
                child: Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          verticalSpace(15),
                          AutoSizeText(
                            AppLocalizations.of(context)!.logIn,
                            style: AppTextStyles.style24WhiteW500
                                .copyWith(color: AppColors.blackColor),
                            textAlign: TextAlign.left,
                          ),
                          verticalSpace(15),
                          CustomAppFormField(
                            isPassword: false,
                            obscureText: false,
                            hintText: AppLocalizations.of(context)!.phoneNumber,
                            controller: LoginCubit.get(context).loginPhoneController,
                            validator:(p0) =>  Validation.validatePhone(p0,context),
                            isPhone: true,
                          ),
                          verticalSpace(10),
                          CustomAppFormField(
                            isPassword: true,
                            obscureText: true,
                            hintText: AppLocalizations.of(context)!.password_required,
                            controller: LoginCubit.get(context).loginPassController,
                            validator:(p0) =>  Validation.validatePassword(p0,context),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, AppRoutes.verificationPhoneAndPassword);
                            },
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: AutoSizeText(
                                AppLocalizations.of(context)!.forgotPassword,
                                style: AppTextStyles.style16WhiteW500
                                    .copyWith(color: AppColors.redColor, fontSize: 14.sp),
                              ),
                            ),
                          ),
                          // const Spacer(),
                
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              BlocConsumer<LoginCubit, LoginState>(
  listener: (context, state) {
    if (state is LoginInSuccess) {
      Navigator.pushReplacementNamed(context, AppRoutes.generalScreen);
    }
    else if (state is LoginInError) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage)));
    }
  },
  builder: (context, state) {
    if (state is LoginInLoading) {
      return CustomLoading();

    }
    return CustomAppBottom(
                onPressed: () {
                  LoginCubit.get(context).loginValidate(context);

                },

                buttonText: AppLocalizations.of(context)!.logIn,
              );
  },
),
              verticalSpace(10),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.signUp);
                },
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: AppLocalizations.of(context)!.dontHaveAccount,
                      style: AppTextStyles.style16WhiteW500
                          .copyWith(color: AppColors.blackColor),
                      children: [
                        TextSpan(
                          text: AppLocalizations.of(context)!.signUp,
                          style: AppTextStyles.style16WhiteW500
                              .copyWith(color: AppColors.blueColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              verticalSpace(50),

            ],
          )),
    );
  }
}
