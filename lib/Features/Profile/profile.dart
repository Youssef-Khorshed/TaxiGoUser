import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Features/Profile/profile_widgets/custom_chageLanguage_profile.dart';
import 'package:taxi_go_user_version/Features/Profile/profile_widgets/custom_raw_profile.dart';

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
          'Profile',
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
                width: size.width * 0.3,
                height: size.width * 0.3,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
              CircleAvatar(
                radius: size.width * 0.06,
                backgroundColor: AppColors.blueColor.withOpacity(0.5),
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.white,
                  size: size.width * 0.06,
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(size.width * 0.05),
            decoration: const BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomRawProfile(title: 'Name', content: 'Mohamed'),
                CustomRawProfile(title: 'Gender', content: 'Male'),
                CustomRawProfile(title: 'Email', content: 'Mohamed@gmail.com'),
                CustomRawProfile(title: 'Phone', content: '+994 012344'),
                CustomRawProfile(title: 'BirthDate', content: '1-1-1999'),
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
