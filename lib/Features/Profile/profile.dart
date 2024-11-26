import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
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
      backgroundColor: AppColors.blueColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(30),
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
            verticalSpace(size.height * 0.1),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                // Reason Selection Container
                Container(
                  width: double.infinity,
                  height: size.height * 0.6,
                  padding: EdgeInsets.all(size.width * 0.05),
                  // margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomRawProfile(title: 'Name', content: 'Mohamed'),
                      CustomRawProfile(title: 'Gender', content: 'Male'),
                      CustomRawProfile(
                          title: 'Email', content: 'Mohamed@gmail.com'),
                      CustomRawProfile(title: 'Phone', content: '+994 012344'),
                      CustomRawProfile(title: 'BirthDate', content: '1-1-1999'),
                      CustomRawProfile(title: 'Language', content: 'Ar')
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
