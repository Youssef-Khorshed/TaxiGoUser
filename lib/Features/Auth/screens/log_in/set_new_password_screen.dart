import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Core/Utils/app_custom_widgets/custom_app_bottom.dart';
import 'package:taxi_go_user_version/Features/App/app_widgets/custom_loading.dart';
import 'package:taxi_go_user_version/Features/Auth/screens/auth_widgets/custom_auth_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_user_version/Features/Auth/screens/sign_up/controller/set_new_password/set_new_password_cubit.dart';
import '../../../../Core/Utils/app_custom_widgets/custom_app_form_field.dart';
import '../../../../Core/Utils/validation.dart';

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
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 80),
            child: const CustomAuthAppBar()),
        body: Form(
          key: SetNewPasswordCubit.get(context).setNewPasswordFormKey,
          autovalidateMode:
              SetNewPasswordCubit.get(context).setNewPasswordAutoValidateMode,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  verticalSpace(10),
                  AutoSizeText(
                    AppLocalizations.of(context)!.setYourPassword,
                    style: AppTextStyles.style24BlackW500,
                    textAlign: TextAlign.left,
                  ),
                  verticalSpace(10),
                  CustomAppFormField(
                    validator: (p0) =>
                        Validation.validatePassword(p0!, context),
                    isPassword: true,
                    obscureText: true,
                    hintText: AppLocalizations.of(context)!.enterYourPassword,
                    controller:
                        SetNewPasswordCubit.get(context).setPasswordController,
                  ),
                  CustomAppFormField(
                    validator: (p0) =>
                        Validation.validatePassword(p0!, context),
                    isPassword: true,
                    obscureText: true,
                    hintText: AppLocalizations.of(context)!.confirmPassword,
                    controller: SetNewPasswordCubit.get(context)
                        .setPasswordConfirmationController,
                  ),
                  const Spacer(),
                  BlocConsumer<SetNewPasswordCubit, SetNewPasswordState>(
                    listener: (context, state) {
                      if (state is SetNewPasswordSuccess) {
                        Navigator.pushReplacementNamed(
                            context, AppRoutes.generalScreen);
                      } else if (state is SetNewPasswordError) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(state.message),
                          duration: const Duration(seconds: 2),
                        ));
                      }
                    },
                    builder: (context, state) {
                      if (state is SetNewPasswordLoading) {
                        return CustomLoading();
                      }
                      return CustomAppBottom(
                        onPressed: () {
                          SetNewPasswordCubit.get(context)
                              .setPasswordValidate(context, widget.phone!);
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
