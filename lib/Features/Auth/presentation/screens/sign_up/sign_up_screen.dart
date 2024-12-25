import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Core/Utils/app_custom_widgets/custom_drop_down.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../Core/Utils/app_custom_widgets/custom_app_bottom.dart';
import '../../../../../Core/Utils/app_custom_widgets/custom_app_form_field.dart';
import '../../../../../Core/Utils/enums/gender.dart';
import '../../../../../Core/Utils/validation.dart';
import '../../../../App/app_widgets/custom_loading.dart';
import '../../auth_widgets/custom_auth_app_bar.dart';
import '../../auth_widgets/custom_terms_check_box.dart';
import '../../controller/sign_up_cubit.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isChecked = true;

  void dispose() {
    super.dispose();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  String selectedGender = Gender.non.name;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<SignUpCubit, SignUpState>(
          builder: (context, state) {
            SignUpCubit cubit = SignUpCubit.get(context);

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
              child: Form(
                autovalidateMode: cubit.autoValidateMode,
                key: cubit.formKey1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ),
                    verticalSpace(10.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                      child: AutoSizeText(
                        AppLocalizations.of(context)!.createAccount,
                        style: AppTextStyles.style24WhiteW500.copyWith(
                          color: Colors.black,
                          fontSize: 20.sp,
                        ),
                      ),
                    ),
                    verticalSpace(10.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.0.w),
                      child: Column(
                        children: [
                          CustomAppFormField(
                            hintStyle: AppTextStyles.style14BlackW500,
                            validator: (p0) =>
                                Validation.validateName(p0, context),
                            hintText: AppLocalizations.of(context)!.name,
                            controller: SignUpCubit.get(context).nameController,
                          ),
                          verticalSpace(10.h),
                          CustomAppFormField(
                            hintStyle: AppTextStyles.style14BlackW500,
                            hintText: AppLocalizations.of(context)!.phoneNumber,
                            validator: (p0) =>
                                Validation.validatePhone(p0, context),
                            controller: cubit.phoneController,
                            isPhone: true,
                          ),
                          verticalSpace(10.h),
                          CustomDropDownFormFieldAuth(
                            items: SignUpCubit.get(context).genderList(context),
                            nameTextStyle: AppTextStyles.style14BlackW500,
                            name: selectedGender == Gender.non.name
                                ? AppLocalizations.of(context)!
                                    .please_select_gender
                                : selectedGender,
                            bordercolor: AppColors.blackColor.withAlpha(70),
                            onChanged: (value) {
                              SignUpCubit.get(context).selectedGender =
                                  value == AppLocalizations.of(context)!.male
                                      ? Gender.male
                                      : Gender.female;
                              setState(() {});
                              selectedGender = value!;
                            },
                          ),
                          verticalSpace(10),
                          CustomTermsCheckBox(
                            isChecked: _isChecked,
                            onChanged: (value) {
                              setState(() {
                                _isChecked = value!;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    BlocConsumer<SignUpCubit, SignUpState>(
                      listener: (context, state) {
                        if (state is SignUpSuccess) {
                          Navigator.pushNamed(context, AppRoutes.otp);
                        } else if (state is SignUpFailure) {
                          Fluttertoast.showToast(
                            msg: state.message,
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is SignUpLoading) {
                          return const CustomLoading();
                        } else {
                          return CustomAppBottom(
                              buttonText: AppLocalizations.of(context)!.sign_up,
                              onPressed: () async {
                                // Navigator.pushNamed(context, AppRoutes.otp);
                                if (!_isChecked) {
                                  Fluttertoast.showToast(
                                    msg: "Please accept terms",
                                  );
                                }
                                SignUpCubit.get(context).validate(context);

                                // Navigator.pushNamed(context, AppRoutes.otp);

                                setState(() {});
                              });
                        }
                      },
                    ),
                    verticalSpace(10.h),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: AppLocalizations.of(context)!
                              .already_have_an_account,
                          style: AppTextStyles.style20BlackW500
                              .copyWith(fontSize: 12.sp),
                          children: [
                            TextSpan(
                              text: AppLocalizations.of(context)!.logIn,
                              style: AppTextStyles.style16WhiteW500.copyWith(
                                  color: AppColors.blueColor, fontSize: 13.sp),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, AppRoutes.logIn);
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                    verticalSpace(20.h),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CustomDropDownFormFieldAuth extends StatefulWidget {
  final List<String> items;
  final String name;
  final Color? backgroundcolor;
  final Color bordercolor;
  final Color? iconEnabledColor;
  final Gradient? gradient;
  final TextStyle? nameTextStyle;
  CustomDropDownFormFieldAuth(
      {super.key,
      required this.items,
      required this.name,
      this.gradient,
      this.iconEnabledColor,
      this.nameTextStyle,
      this.bordercolor = AppColors.blackColor,
      this.backgroundcolor,
      this.onChanged});
  void Function(String?)? onChanged;

  @override
  State<CustomDropDownFormFieldAuth> createState() =>
      _CustomDropDownFormFieldAuthState();
}

class _CustomDropDownFormFieldAuthState
    extends State<CustomDropDownFormFieldAuth> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton2(
      underline: const SizedBox(),
      isExpanded: true,
      iconStyleData: IconStyleData(iconEnabledColor: widget.iconEnabledColor),
      buttonStyleData: ButtonStyleData(
        decoration: BoxDecoration(
            gradient: widget.gradient,
            color: widget.backgroundcolor,
            border: Border.all(color: widget.bordercolor, width: 2.w),
            borderRadius: BorderRadius.circular(10.r)),
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
        useSafeArea: true,
      ),
      hint: Text(
        selectedValue ?? widget.name,
        style: widget.nameTextStyle,
        textAlign: TextAlign.center,
      ),
      items: widget.items
          .map((gender) => DropdownMenuItem(value: gender, child: Text(gender)))
          .toList(),
      onChanged: widget.onChanged,
    );
  }
}
