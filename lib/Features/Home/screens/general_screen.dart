import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_go_user_version/Core/Utils/Assets/icons/app_icons.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Features/Chat/chat.dart';
import 'package:taxi_go_user_version/Features/History/Screens/my_history.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_screen.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_app_drawer.dart';
import 'package:taxi_go_user_version/Features/Favourite/Screens/tripFavourite.dart';
import 'package:taxi_go_user_version/Features/Saved/Screens/tripSaved.dart';
import 'package:taxi_go_user_version/Features/Wallet/screens/wallet.dart';

class GeneralScreen extends StatefulWidget {
  const GeneralScreen({super.key});

  @override
  State<GeneralScreen> createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<GeneralScreen> {
  int selctedIndex = 0;
  // Updated list with the correct number of screens
  List<Widget> screens = [
    const HomeScreen(),
    const HistoryScreen(),
    const FavouriteScreen(),
    const SavedScreen(),
    const WalletScreen(),
  ];

  // Corrected screen names to match the number of screens
  List<String> screensName = const [
    "Home",
    "Trip History",
    "Trip Favourite",
    "Trip Saved",
    "Wallet",
  ];
  void onItemTap(int index) {
    setState(() {
      selctedIndex = index;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.blueColor,
      drawer: CustomAppDrawer(
        onItemTap: (index) => onItemTap(index),
        selectedIndex: selctedIndex,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          verticalSpace(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Builder(builder: (context) {
                  return InkWell(
                      onTap: () => Scaffold.of(context).openDrawer(),
                      child: SvgPicture.asset(AppIcons.menuIcon));
                }),
                AutoSizeText(screensName[selctedIndex],
                    style: AppTextStyles.style24WhiteW500),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.profile);
                  },
                  child: const CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage(AppIcons.appIcon),
                  ),
                )
              ],
            ),
          ),
          verticalSpace(20),
          Expanded(child: screens[selctedIndex])
        ],
      ),
    ));
  }
}
