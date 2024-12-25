import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taxi_go_user_version/Core/Utils/Assets/images/app_images.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Core/Utils/app_custom_widgets/custom_drop_down.dart';
import 'package:taxi_go_user_version/Core/Utils/validation.dart';
import 'package:taxi_go_user_version/Features/App/app_widgets/custom_loading.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../Core/Utils/app_custom_widgets/custom_app_form_field.dart';
import '../../auth_widgets/CustomerDropDownFormField2.dart';
import '../../auth_widgets/custom_set_profile_bottoms.dart';
import '../../controller/create_profile_cubit/create_profile_cubit.dart';
import '../../controller/image_cubit/image__cubit.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});
  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  @override
  void initState() {
    getCities();
    super.initState();
  }

  Future<void> getCities() async {
    await CreateProfileCubit.get(context).getCities(context);
    setState(() {});
  }

  File? file;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:BlocBuilder<CreateProfileCubit, CreateProfileState>(
  builder: (context, state) {
    return Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
              child: Form(
                key: CreateProfileCubit.get(context).formKey,
                autovalidateMode:
                    CreateProfileCubit.get(context).autovalidateMode,
                child: SingleChildScrollView(
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
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ),
                      verticalSpace(30.h),
                      Center(
                        child: Stack(
                          children: [
                            BlocProvider(
                              create: (_) => ImageCubit(),
                              child: BlocBuilder<ImageCubit, ImageState>(
                                builder: (context, state) {
                                  file = ImageCubit.get(context).file;
                                  Widget avatarContent;

                                  if (state is ImagePicked) {
                                    avatarContent = ClipOval(
                                      child: Image.file(
                                        state.image,
                                        width: 130.w,
                                        height: 130.h,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  } else {
                                    avatarContent = CircleAvatar(
                                      radius: 65.r,
                                      backgroundColor: Colors.white,
                                      child: Image.asset(
                                        AppImages.user
                                      ),
                                    );
                                  }

                                  return Stack(
                                    children: [
                                      avatarContent,
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: GestureDetector(
                                          onTap: () => context
                                              .read<ImageCubit>()
                                              .pickImage(),
                                          child: CircleAvatar(
                                            radius: 20.r,
                                            backgroundColor: AppColors.blueColor,
                                            child: Icon(
                                              Icons.camera_enhance_outlined,
                                              color: Colors.white,
                                              size: 18.r,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      verticalSpace(30.h),
                      // const CustomAppFormField(
                      //
                      //
                      //   isPassword: false,
                      //   obscureText: false,
                      //   hintText: "Enter Your Name",
                      //   isPhone: false,
                      // ),
                      // verticalSpace(10),
                      // CustomAppFormField(
                      //   isPassword: false,
                      //   obscureText: false,
                      //   hintText: "Enter Your Phone Number",
                      //   controller: CreateProfileCubit.get(context).emailController,
                      //   isPhone: true,
                      // ),
                      // verticalSpace(10),
                      // CustomAppFormField(
                      //   isPassword: false,
                      //   obscureText: false,
                      //   validator:(value) {
                      //     return  Validation.validateName(value, context);
                      //   },
                      //   controller: CreateProfileCubit.get(context).emailController,
                      //   hintText: "Enter Your Email",
                      //   isPhone: false,
                      // ),
                      verticalSpace(10.h),
                      CustomAppFormField(
                        hintStyle: AppTextStyles.style14BlackW500,
                        validator: (value) {
                          return Validation.validateName(value, context);
                        },
                        controller:
                            CreateProfileCubit.get(context).streetController,
                        isPassword: false,
                        obscureText: false,
                        hintText: AppLocalizations.of(context)!.enterYourStreet,
                        isPhone: false,
                      ),
                      verticalSpace(10.h),

                      CustomDropDownFormField3(
                        nameTextStyle: AppTextStyles.style14BlackW500,
                        bordercolor: AppColors.grayColor,
                        onChanged: (p0) async {
                          CreateProfileCubit.get(context).selectedDistrictId =
                              p0!.id!.toString();

                          await CreateProfileCubit.get(context)
                              .getDistricts(context, p0.id!);
                        },
                        items: CreateProfileCubit.get(context)
                                .getCitiesModel
                                ?.data
                                ?.cities ??
                            [],
                        name: AppLocalizations.of(context)!.city,
                      ),
                      verticalSpace(10.h),

                      CreateProfileCubit.get(context)
                          .selectedCityId!=null&&CreateProfileCubit.get(context).directionModel!="" ?  CustomDropDownFormField2(
                        nameTextStyle: AppTextStyles.style14BlackW500,
                        bordercolor:AppColors.grayColor,
                        onChanged: (p0) {
                          CreateProfileCubit.get(context).selectedDistrictId =
                              p0!.id!.toString();
                          print(
                              "EEEEEEEEEEEEEEEE${CreateProfileCubit.get(context).selectedDistrictId}");
                        },
                        items: CreateProfileCubit.get(context)
                                .directionModel!.data!.districts!,
                        name: AppLocalizations.of(context)!.district,
                      ): Container(),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.31),
                      Row(
                        children: [
                          /*      Expanded(
                        child: CustomSetProfileButtoms(
                          text: "Cancel",
                          backgroundColor: AppColors.whiteColor,
                          textColor: AppColors.blackColor,
                          borderColor: AppColors.blueColor,
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(context, AppRoutes.logIn, (route) => false);

                          },
                        ),
                      ),*/
                          /*        horizontalSpace(10),*/
                          Expanded(
                            child: BlocBuilder<CreateProfileCubit, CreateProfileState>(
  builder: (context, state) {
    if (state is CreateProfileLoading) {
      return const CustomLoading();
    }
    return CustomSetProfileButtoms(
                              text: AppLocalizations.of(context)!.save,
                              backgroundColor: AppColors.blueColor,
                              textColor: AppColors.whiteColor,
                              onPressed: () async {
                                await CreateProfileCubit.get(context)
                                    .createProfileValidate(context, file);
                                setState(() {});
                                // Navigator.pushNamed(context, AppRoutes.generalScreen);
                              },
                            );
  },
),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
  },
),
          )
        );
  }
} /**/
