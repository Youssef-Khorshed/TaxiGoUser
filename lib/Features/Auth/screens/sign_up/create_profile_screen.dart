import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Core/Utils/app_custom_widgets/custom_drop_down.dart';
import 'package:taxi_go_user_version/Features/Auth/presentation/auth_widgets/custom_set_profile_bottoms.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/customAppFormField.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  final List<String> city = ['Cairo', 'Giza', 'Alexandria', 'Other'];

  final List<String> district = ['Other'];

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final streetNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Row(children: [
                    const Icon(
                      FontAwesomeIcons.angleLeft,
                      color: Colors.black,
                      size: 25,
                    ),
                    horizontalSpace(5),
                    AutoSizeText(AppLocalizations.of(context)!.back,
                        style: AppTextStyles.style20BlackW500)
                  ]),
                ),
                verticalSpace(30),
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 65,
                      backgroundColor: Colors.grey[300],
                    ),
                    Positioned(
                      bottom: 5,
                      right: 0,
                      child: CircleAvatar(
                        backgroundColor: AppColors.blueColor,
                        radius: 20,
                        child: IconButton(
                          icon: const Icon(FontAwesomeIcons.cameraRotate,
                              size: 18, color: AppColors.whiteColor),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
                verticalSpace(30),
                CustomTextFormFiled(
                  isPassword: false,
                  obscureText: false,
                  hintText: AppLocalizations.of(context)!.enter_your_name,
                  controller: nameController,
                  textStyle: AppTextStyles.style12DarkgrayW400,
                  hinttextStyle: AppTextStyles.style12DarkgrayW400,
                ),
                verticalSpace(10),
                CustomTextFormFiled(
                  isPassword: false,
                  obscureText: false,
                  hintText:
                      AppLocalizations.of(context)!.enter_your_phone_number,
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  textStyle: AppTextStyles.style12DarkgrayW400,
                  hinttextStyle: AppTextStyles.style12DarkgrayW400,
                ),
                verticalSpace(10),
                CustomTextFormFiled(
                  isPassword: false,
                  obscureText: false,
                  hintText: AppLocalizations.of(context)!.enter_your_email,
                  controller: emailController,
                  textStyle: AppTextStyles.style12DarkgrayW400,
                  hinttextStyle: AppTextStyles.style12DarkgrayW400,
                ),
                verticalSpace(10),
                CustomTextFormFiled(
                  isPassword: false,
                  obscureText: false,
                  hintText: AppLocalizations.of(context)!.enter_your_street,
                  controller: streetNameController,
                  textStyle: AppTextStyles.style12DarkgrayW400,
                  hinttextStyle: AppTextStyles.style12DarkgrayW400,
                ),
                verticalSpace(10),
                CustomDropDownFormField(
                  items: city,
                  name: AppLocalizations.of(context)!.city_k,
                ),
                verticalSpace(10),
                CustomDropDownFormField(
                  items: district,
                  name: AppLocalizations.of(context)!.district_k,
                ),
                verticalSpace(20),
                Row(
                  children: [
                    Expanded(
                      child: CustomSetProfileButtoms(
                        text: AppLocalizations.of(context)!.cancel_k,
                        backgroundColor: AppColors.whiteColor,
                        textColor: AppColors.blackColor,
                        borderColor: AppColors.blueColor,
                        onPressed: () {},
                      ),
                    ),
                    horizontalSpace(10),
                    Expanded(
                      child: CustomSetProfileButtoms(
                        text: AppLocalizations.of(context)!.save_k,
                        backgroundColor: AppColors.blueColor,
                        textColor: AppColors.whiteColor,
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.generalScreen);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
