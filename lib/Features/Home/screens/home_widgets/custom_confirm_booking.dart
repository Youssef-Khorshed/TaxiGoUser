import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import '../../../../Core/Utils/Colors/app_colors.dart';
import '../../../../Core/Utils/Text/text_style.dart';
import 'custom_app_bottom.dart';
import 'custom_change_address_text.dart';
import 'custom_rating_text.dart';

class CustomConfirmBooking extends StatelessWidget {
  const CustomConfirmBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColors.grayColor,
                      child: Icon(
                        Icons.person_sharp,
                        color: AppColors.darkgrayColor,
                      ),
                    ),
                    const CustomRatingText(),
                    const Spacer(),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        maxRadius: 15,
                        backgroundColor: AppColors.lightGreen,
                        child: Icon(
                          Icons.phone_outlined,
                          color: AppColors.whiteColor,
                          size: 15,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.chat);
                      },
                      child: const CircleAvatar(
                          maxRadius: 15,
                          backgroundColor: AppColors.blueColor,
                          child: Icon(
                            Icons.message_outlined,
                            color: AppColors.whiteColor,
                            size: 15,
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        verticalSpace(15),
        const CustomChangeAddressText(
          title: "Current location",
          subtitle: "2972 Westheimer Rd. Santa Ana, Illinois 85486",
          iconColor: AppColors.redColor,
          distance: "",
        ),
        verticalSpace(10),
        const CustomChangeAddressText(
          title: "Office",
          subtitle: "1901 Thornridge Cir. Shiloh, Hawaii 81063",
          iconColor: AppColors.blueColor,
          distance: "",
        ),
        verticalSpace(15),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                AutoSizeText(
                  "Distance",
                  style: AppTextStyles.style16BlackW600,
                ),
                verticalSpace(2),
                AutoSizeText(
                  "50 Km",
                  style: AppTextStyles.style14BlackW500,
                ),
              ],
            ),
            Column(
              children: [
                AutoSizeText(
                  "Time",
                  style: AppTextStyles.style16BlackW600,
                ),
                verticalSpace(2),
                AutoSizeText(
                  "10 min",
                  style: AppTextStyles.style14BlackW500,
                ),
              ],
            ),
          ],
        ),
        verticalSpace(10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Row(
            children: [
              CustomAppBottom(
                  onPressed: () {},
                  text: "Back",
                  bottomColor: AppColors.whiteColor,
                  hasIcon: false,
                  textColor: AppColors.redColor),
              CustomAppBottom(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.payment);
                  },
                  text: "Confirm",
                  bottomColor: AppColors.blueColor,
                  hasIcon: false,
                  textColor: AppColors.whiteColor),
            ],
          ),
        )
      ],
    );
  }
}
