import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
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
          child: const Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.grayColor,
                    child: Icon(
                      Icons.person_sharp,
                      color: AppColors.darkgrayColor,
                    ),
                  ),
                  CustomRatingText(),
                  Spacer(),
                  Padding(
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
                  CircleAvatar(
                      maxRadius: 15,
                      backgroundColor: AppColors.blueColor,
                      child: Icon(
                        Icons.message_outlined,
                        color: AppColors.whiteColor,
                        size: 15,
                      )),
                ],
              ),
            ],
          ),
        ),
        const Divider(
          color: AppColors.grayColor,
          height: .7,
          endIndent: 1,
        ),
        const CustomChangeAddressText(
          title: "Current location",
          subtitle: "2972 Westheimer Rd. Santa Ana, Illinois 85486",
          iconColor: AppColors.redColor,
          distance: "",
        ),
        const CustomChangeAddressText(
          title: "Office",
          subtitle: "1901 Thornridge Cir. Shiloh, Hawaii 81063",
          iconColor: AppColors.blueColor,
          distance: "",
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AutoSizeText(
              "Distance",
              style: AppTextStyles.style16BlackW600,
            ),
            AutoSizeText(
              "Time",
              style: AppTextStyles.style16BlackW600,
            ),
          ],
        ),
        Row(
          children: [
            CustomAppBottom(
                onPressed: () {},
                text: "Back",
                bottomColor: AppColors.whiteColor,
                hasIcon: false,
                textColor: AppColors.redColor),
            CustomAppBottom(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                text: "Confirm",
                bottomColor: AppColors.blueColor,
                hasIcon: false,
                textColor: AppColors.whiteColor),
          ],
        )
      ],
    );
  }
}
