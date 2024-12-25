import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Features/Profile/profile_widgets/custom_chage_language_profile.dart';
import 'package:taxi_go_user_version/Features/Profile/profile_widgets/custom_raw_profile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blueColor,
        elevation: 0,
        centerTitle: true,
        title: AutoSizeText(
          AppLocalizations.of(context)!.profile_k,
          style: AppTextStyles.style20WhiteW600,
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_sharp,
              color: AppColors.whiteColor,
            )),
      ),
      backgroundColor: AppColors.blueColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          verticalSpace(size.height * 0.15),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: size.width * 0.3.w,
                height: size.width * 0.3.h,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
              CircleAvatar(
                radius: size.width * 0.06.r,
                backgroundColor: AppColors.blueColor.withOpacity(0.5),
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.white,
                  size: size.width * 0.06.sp,
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(size.width * 0.05.sp),
            decoration:  BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomRawProfile(title: AppLocalizations.of(context)!.name, content: 'Mohamed'),
                CustomRawProfile(title: AppLocalizations.of(context)!.gender, content: 'Male'),
                CustomRawProfile(title: AppLocalizations.of(context)!.email, content: 'Mohamed@gmail.com'),
                CustomRawProfile(title: AppLocalizations.of(context)!.phone, content: '+994 012344'),
                CustomRawProfile(title: AppLocalizations.of(context)!.birth_date, content: '1-1-1999'),
                // CustomRawProfile(title: 'Language', content: 'Ar')
                CustomChagelanguageProfile(
                  toggleLanguage: () {},
                ),

                verticalSpace(10)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
