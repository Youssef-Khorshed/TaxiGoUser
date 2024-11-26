import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../../../Core/Utils/Colors/app_colors.dart';
import '../../../../Core/Utils/Text/text_style.dart';
import 'custom_app_bottom.dart';
import 'custom_booking_buttom_sheet.dart';
import 'custom_change_address_text.dart';

class ChangeAddressButtomSheet extends StatelessWidget {
  const ChangeAddressButtomSheet({super.key});

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
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close, color: Colors.grey),
            ),
          ),
          AutoSizeText(
            'Change address',
            style: AppTextStyles.style18BlueBold,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Divider(
              color: AppColors.grayColor,
              height: .7,
            ),
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
                        return const CustomBookingButtomSheet();
                      },
                    );
                  },
                  text: "Done",
                  bottomColor: AppColors.blueColor,
                  hasIcon: false,
                  textColor: AppColors.whiteColor),
            ],
          )
        ],
      ),
    );
  }
}
