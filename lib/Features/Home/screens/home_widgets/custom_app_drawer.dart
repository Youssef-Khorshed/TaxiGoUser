import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taxi_go_user_version/Core/Utils/Assets/icons/app_icons.dart';
import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';

import '../../../../Core/Utils/Colors/app_colors.dart';
import '../../../../Core/Utils/Spacing/app_spacing.dart';
import '../../../../Core/Utils/Text/text_style.dart';

class CustomAppDrawer extends StatefulWidget {
  final int selectedIndex;
  final Function(int index) onItemTap;
  const CustomAppDrawer(
      {super.key, required this.selectedIndex, required this.onItemTap});

  @override
  State<CustomAppDrawer> createState() => _CustomAppDrawerState();
}

class _CustomAppDrawerState extends State<CustomAppDrawer> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.7,
      decoration: const BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20))),
      child: ListView(
          padding: EdgeInsets.only(
            top: height * 0.05,
            right: 5,
            left: 5,
          ),
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(AppIcons.appIcon),
                    ),
                    verticalSpace(10),
                    AutoSizeText(
                      'Philobater samir',
                      style: AppTextStyles.style16WhiteW500.copyWith(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                verticalSpace(10),
                ListTile(
                  leading: const Icon(
                    FontAwesomeIcons.houseChimney,
                    color: AppColors.blueColor,
                  ),
                  title: Text(
                    'Home',
                    style: AppTextStyles.style20BlackW500
                        .copyWith(color: AppColors.blueColor),
                  ),
                  selected: widget.selectedIndex == 0,
                  onTap: () => widget.onItemTap(0),
                ),
                ListTile(
                  leading: const Icon(
                    FontAwesomeIcons.clockRotateLeft,
                    color: AppColors.blueColor,
                  ),
                  title: Text(
                    'Trip History',
                    style: AppTextStyles.style20BlackW500
                        .copyWith(color: AppColors.blueColor),
                  ),
                  selected: widget.selectedIndex == 1,
                  onTap: () => widget.onItemTap(1),
                ),
                ListTile(
                  leading: const Icon(
                    FontAwesomeIcons.star,
                    color: AppColors.blueColor,
                  ),
                  title: Text(
                    'Trip Favorite',
                    style: AppTextStyles.style20BlackW500
                        .copyWith(color: AppColors.blueColor),
                  ),
                  selected: widget.selectedIndex == 2,
                  onTap: () => widget.onItemTap(2),
                ),
                ListTile(
                  leading: const Icon(
                    FontAwesomeIcons.floppyDisk,
                    color: AppColors.blueColor,
                  ),
                  title: Text(
                    'Trip Saved',
                    style: AppTextStyles.style20BlackW500
                        .copyWith(color: AppColors.blueColor),
                  ),
                  selected: widget.selectedIndex == 3,
                  onTap: () => widget.onItemTap(3),
                ),
                ListTile(
                  leading: const Icon(
                    FontAwesomeIcons.wallet,
                    color: AppColors.blueColor,
                  ),
                  title: Text(
                    'Wallet',
                    style: AppTextStyles.style20BlackW500
                        .copyWith(color: AppColors.blueColor),
                  ),
                  selected: widget.selectedIndex == 4,
                  onTap: () => widget.onItemTap(4),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.notifications,
                    color: AppColors.blueColor,
                  ),
                  title: Text(
                    'Notification',
                    style: AppTextStyles.style20BlackW500
                        .copyWith(color: AppColors.blueColor),
                  ),
                  selected: widget.selectedIndex == 5,
                  onTap: () => widget.onItemTap(5),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.logout,
                    color: AppColors.redColor,
                  ),
                  title: Text(
                    'Logout',
                    style: AppTextStyles.style20BlackW500
                        .copyWith(color: AppColors.redColor),
                  ),
                  selected: widget.selectedIndex == 6,
                  onTap: () => Navigator.pushReplacementNamed(
                      context, AppRoutes.welcome),
                ),
              ],
            ),
          ]),
    );
  }
}
