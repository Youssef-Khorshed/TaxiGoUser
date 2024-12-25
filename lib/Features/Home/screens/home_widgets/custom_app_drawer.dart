import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taxi_go_user_version/Core/Utils/Assets/images/app_images.dart';
import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';
import '../../../../Core/Utils/Colors/app_colors.dart';
import '../../../../Core/Utils/Spacing/app_spacing.dart';
import '../../../../Core/Utils/Text/text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      width: width * 0.7.w,
      decoration:  BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.r), bottomRight: Radius.circular(20.r))),
      child: ListView(
          padding: EdgeInsets.only(
            top: height * 0.05.h,
            right: 5.w,
            left: 5.w,
          ),
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 40.r,
                      backgroundImage: const AssetImage(AppImages.appImage),
                    ),
                    verticalSpace(10),
                    AutoSizeText(
                      AppLocalizations.of(context)!.user_name,
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
                    AppLocalizations.of(context)!.home,
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
                    AppLocalizations.of(context)!.trips_history,
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
                    AppLocalizations.of(context)!.trip_favorites,
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
                    AppLocalizations.of(context)!.saved_Trips,
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
                    AppLocalizations.of(context)!.wallet,
                    style: AppTextStyles.style20BlackW500
                        .copyWith(color: AppColors.blueColor),
                  ),
                  selected: widget.selectedIndex == 4,
                  onTap: () => widget.onItemTap(4),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.logout,
                    color: AppColors.redColor,
                  ),
                  title: Text(
                    AppLocalizations.of(context)!.log_out,
                    style: AppTextStyles.style20BlackW500
                        .copyWith(color: AppColors.redColor),
                  ),
                  selected: widget.selectedIndex == 5,
                  onTap: () => Navigator.pushReplacementNamed(
                      context, AppRoutes.welcome),
                ),
              ],
            ),
          ]),
    );
  }
}
