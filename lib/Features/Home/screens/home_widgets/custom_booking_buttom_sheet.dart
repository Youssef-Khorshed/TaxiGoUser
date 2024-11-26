import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_app_bottom.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_car_discription.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_confirm_booking.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_rating_text.dart';

import '../../../../Core/Utils/Colors/app_colors.dart';

class CustomBookingButtomSheet extends StatelessWidget {
  const CustomBookingButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: AppColors.ligterBlueColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(
                width: .8,
                color: AppColors.darkgrayColor,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColors.grayColor,
                      child: Icon(
                        Icons.person_sharp,
                        color: AppColors.darkgrayColor,
                      ),
                    ),
                    CustomRatingText(),
                    Spacer(),
                    CustomCarDiscription()
                  ],
                ),
                AutoSizeText(
                  "far 4 km",
                  style: AppTextStyles.style16DarkgrayW500,
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: CustomAppBottom(
                onPressed: () {
                  Navigator.of(context).pop();
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                    ),
                    builder: (context) {
                      return const CustomConfirmBooking();
                    },
                  );
                },
                text: "Booking Now",
                bottomColor: AppColors.blueColor,
                hasIcon: false,
                textColor: AppColors.whiteColor),
          )
        ],
      ),
    );
  }
}
