import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_go_user_version/Core/Utils/Assets/icons/app_icons.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_app_drawer.dart';

class GeneralScreen extends StatefulWidget {
  const GeneralScreen({super.key});

  @override
  State<GeneralScreen> createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<GeneralScreen> {
  int selctedIndex = 0;
  List<Widget> screens = const [
    Scaffold(
      backgroundColor: Colors.red,
    ),
    Scaffold(
      backgroundColor: Colors.orange,
    ),
    Scaffold(
      backgroundColor: Colors.green,
    ),
    Scaffold(
      backgroundColor: Colors.pink,
    )
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
                const CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage(AppIcons.appIcon),
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
