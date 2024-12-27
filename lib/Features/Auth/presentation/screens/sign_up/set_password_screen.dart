import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Core/Utils/app_custom_widgets/custom_app_form_field.dart';
import 'package:taxi_go_user_version/Core/Utils/validation.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../Core/Utils/app_custom_widgets/custom_app_bottom.dart';
import '../../../../App/app_widgets/custom_loading.dart';
import '../../controller/set_password_cubit/set_password_cubit.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SetPasswordScreenState createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  autovalidateMode:
                      SetPasswordCubit.get(context).setPasswordAutoValidateMode,
                  key: SetPasswordCubit.get(context).setPasswordFormKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 13.0.w, vertical: 10.h),
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
                        verticalSpace(20.h),
                        Center(
                          child: Text(
                            AppLocalizations.of(context)!.setPassword,
                            style: AppTextStyles.style24WhiteW500
                                .copyWith(color: Colors.black),
                          ),
                        ),
                        verticalSpace(15.h),
                        Padding(
                          padding: EdgeInsets.all(4.0.w),
                          child: Column(
                            children: [
                              CustomAppFormField(
                                hintStyle: AppTextStyles.style14BlackW500,
                                isPassword: true,
                                obscureText: true,
                                validator: (value) =>
                                    Validation.validatePassword(value, context),
                                hintText: AppLocalizations.of(context)!
                                    .setYourPassword,
                                controller: SetPasswordCubit.get(context)
                                    .setPasswordController,
                                isNumbers: false,
                              ),
                              verticalSpace(10.h),
                              CustomAppFormField(
                                hintStyle: AppTextStyles.style14BlackW500,
                                validator: (value) =>
                                    Validation.validatePassword(value, context),
                                isPassword: true,
                                obscureText: true,
                                hintText: AppLocalizations.of(context)!
                                    .confirmPassword,
                                controller: SetPasswordCubit.get(context)
                                    .setPasswordConfirmationController,
                                isNumbers: false,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            verticalSpace(10.h),
            BlocConsumer<SetPasswordCubit, SetPasswordState>(
              listener: (context, state) {
                if (state is SetPasswordError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.errorMessage),
                    ),
                  );
                } else if (state is SetPasswordSuccess) {
                  Navigator.pushReplacementNamed(context, AppRoutes.setProfile);
                }
              },
              builder: (context, state) {
                if (state is SetPasswordLoading) {
                  return const CustomLoading();
                }
                return CustomAppBottom(
                    buttonText: AppLocalizations.of(context)!.register,
                    onPressed: () async {
                      Navigator.pushNamed(context, AppRoutes.setProfile);

                      await SetPasswordCubit.get(context)
                          .setPasswordValidate(context);
                      setState(() {});
                      //  Navigator.pushNamed(context, AppRoutes.setProfile);
                    });
              },
            ),
            verticalSpace(30.h),
          ],
        ),
      ),
    );
  }
}
