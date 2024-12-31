import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Core/Utils/app_custom_widgets/custom_app_bottom.dart';
import 'package:taxi_go_user_version/Features/App/app_widgets/custom_loading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../Core/Utils/app_custom_widgets/custom_app_form_field.dart';
import '../../../../../Core/Utils/validation.dart';
import '../../controller/set_new_password/set_new_password_cubit.dart';

class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({super.key, required this.phone});
  final String? phone;
  @override
  State<SetNewPasswordScreen> createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: SetNewPasswordCubit.get(context).setNewPasswordFormKey,
          autovalidateMode:
              SetNewPasswordCubit.get(context).setNewPasswordAutoValidateMode,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        AppLocalizations.of(context)!.setYourPassword,
                        style: AppTextStyles.style24BlackW500,
                        textAlign: TextAlign.left,
                      ),
                      verticalSpace(20.h),
                      CustomAppFormField(
                        hintStyle: AppTextStyles.style16DarkgrayW500,
                        validator: (p0) =>
                            Validation.validatePassword(p0!, context),
                        isPassword: true,
                        obscureText: true,
                        hintText:
                            AppLocalizations.of(context)!.enterYourPassword,
                        controller: SetNewPasswordCubit.get(context)
                            .setPasswordController,
                        isNumbers: false,
                      ),
                      verticalSpace(10.h),
                      CustomAppFormField(
                        hintStyle: AppTextStyles.style16DarkgrayW500,
                        validator: (p0) =>
                            Validation.validatePassword(p0!, context),
                        isPassword: true,
                        obscureText: true,
                        hintText: AppLocalizations.of(context)!.confirmPassword,
                        controller: SetNewPasswordCubit.get(context)
                            .setPasswordConfirmationController,
                        isNumbers: false,
                      ),
                    ],
                  ),
                  const Spacer(),
                  BlocConsumer<SetNewPasswordCubit, SetNewPasswordState>(
                    listener: (context, state) {
                      if (state is SetNewPasswordSuccess) {
                        Navigator.pushReplacementNamed(
                            context, AppRoutes.logIn);
                      } else if (state is SetNewPasswordError) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(state.message),
                          duration: const Duration(seconds: 2),
                        ));
                      }
                    },
                    builder: (context, state) {
                      if (state is SetNewPasswordLoading) {
                        return const CustomLoading();
                      }
                      return CustomAppBottom(
                        onPressed: () async {
                          await SetNewPasswordCubit.get(context)
                              .setPasswordValidate(context, widget.phone!);
                          setState(() {});
                          // Navigator.pushReplacementNamed(
                          //     context, AppRoutes.generalScreen);
                        },
                        buttonText: AppLocalizations.of(context)!.save,
                      );
                    },
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
