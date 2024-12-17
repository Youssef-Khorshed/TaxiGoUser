import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/Utils/Colors/app_colors.dart';
import '../../../../Core/Utils/Text/text_style.dart';
import '../../../../Core/Utils/app_custom_widgets/custom_app_bottom.dart';
import '../../../HiringDriver/screens/Payment/payment_method_list_card.dart';
import 'custom_code_text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PaymentButtomSheet extends StatelessWidget {
  const PaymentButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.h),
            child: Divider(
              color: AppColors.grayColor,
              height: .7.h,
            ),
          ),
          AutoSizeText(
            AppLocalizations.of(context)!
                .if_you_have_promo_code_you_can_get_a_discount,
          ),
          const CodeTextField(),
          const PaymentMethodList(),
          Row(
            children: [
              CustomAppBottom(
                  onPressed: () {},
                  buttonText: AppLocalizations.of(context)!.back,
                  buttonColor: AppColors.whiteColor,
                  hasIcon: false,
                  textColor: AppColors.redColor),
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
                        return const PaymentButtomSheet();
                      },
                    );
                  },
                  buttonText: AppLocalizations.of(context)!.done,
                  buttonColor: AppColors.blueColor,
                  hasIcon: false,
                  textColor: AppColors.whiteColor),
            ],
          )
        ],
      ),
    );
  }
}
