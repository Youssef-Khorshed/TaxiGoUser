import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_go_user_version/Core/Utils/Assets/icons/app_icons.dart';
import 'package:taxi_go_user_version/Core/Utils/Assets/images/app_images.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/secure_profile.dart';
import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Features/Favourite/Screens/trip_favourite.dart';
import 'package:taxi_go_user_version/Features/History/Screens/my_history.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_screen.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_app_drawer.dart';
import 'package:taxi_go_user_version/Features/Saved/Screens/trip_saved.dart';
import 'package:taxi_go_user_version/Features/Wallet/screens/wallet_screen.dart';
import 'package:taxi_go_user_version/Features/notification/data/model/firebase_notification.dart';
import 'package:taxi_go_user_version/Features/notification/screens/notification_screen.dart';

class GeneralScreen extends StatefulWidget {
  const GeneralScreen({super.key});

  @override
  State<GeneralScreen> createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<GeneralScreen> {
  int selectedIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const HistoryScreen(),
    const FavouriteScreen(),
    const SavedScreen(),
    const WalletScreen(),
    const NotificationScreen(),
  ];

  // Corrected screen names to match the number of screens

  void onItemTap(int index) {
    setState(() {
      selectedIndex = index;
    });
    Navigator.pop(context);
  }

  String? image;
  Future<void> userImage() async {
    image = await SecureProfile.getProfileImage();
    // setState(() {});
  }

  @override
  void initState() {
    FirebaseNotification.init(context);
    FirebaseNotification.initNotifications();
    userImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> screensName = [
      AppLocalizations.of(context)!.home,
      AppLocalizations.of(context)!.trips_history,
      AppLocalizations.of(context)!.trip_favorites,
      AppLocalizations.of(context)!.saved_Trips,
      AppLocalizations.of(context)!.wallet,
      AppLocalizations.of(context)!.notifications,
    ];
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      drawer: CustomAppDrawer(
        onItemTap: (index) => onItemTap(index),
        selectedIndex: selectedIndex,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            verticalSpace(10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(builder: (context) {
                    return InkWell(
                        onTap: () => Scaffold.of(context).openDrawer(),
                        child: SvgPicture.asset(
                          AppIcons.menuIcon,
                          colorFilter: const ColorFilter.mode(
                              AppColors.blackColor, BlendMode.srcIn),
                        ));
                  }),
                  AutoSizeText(screensName[selectedIndex],
                      style: AppTextStyles.style28BlackW400.copyWith(
                        fontSize: 22.sp,
                      )),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.profile);
                    },
                    child: CircleAvatar(
                      radius: 18.r,
                      backgroundImage: image != null && image != ''
                          ? NetworkImage(image!)
                          : const AssetImage(AppImages.appImage),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: screens[selectedIndex])
          ],
        ),
      ),
    );
  }
}
