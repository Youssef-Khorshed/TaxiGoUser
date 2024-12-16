import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import '../../../../Core/Utils/Colors/app_colors.dart';
import '../../../../Core/Utils/Text/text_style.dart';
import '../../../../Core/Utils/app_custom_widgets/custom_app_bottom.dart';
import 'custom_booking_buttom_sheet.dart';
import 'custom_change_address_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChangeAddressButtomSheet extends StatelessWidget {
  const ChangeAddressButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.0.r),
      decoration: BoxDecoration(
        color: AppColors.ligterBlueColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0.r),
          topRight: Radius.circular(16.0.r),
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
            AppLocalizations.of(context)!.change_address,
            style: AppTextStyles.style18BlueBold,
          ),
          verticalSpace(15.h),
          CustomChangeAddressText(
            title: AppLocalizations.of(context)!.current_location,
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
          verticalSpace(15.h),
          Row(
            children: [
              CustomAppBottom(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                borderColor: AppColors.whiteColor,
                hasIcon: false,
                textColor: AppColors.redColor,
                buttonText: AppLocalizations.of(context)!.back,
              ),
              CustomAppBottom(
                  onPressed: () {
                    Navigator.of(context).pop();
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.0.r),
                          topRight: Radius.circular(16.0.r),
                        ),
                      ),
                      builder: (context) {
                        return const CustomBookingButtomSheet();
                      },
                    );
                  },
                  buttonText: AppLocalizations.of(context)!.done,
                  borderColor: AppColors.blueColor,
                  hasIcon: false,
                  textColor: AppColors.whiteColor),
            ],
          )
        ],
      ),
    );
  }
}
