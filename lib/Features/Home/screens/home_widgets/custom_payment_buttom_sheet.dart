import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../Core/Utils/Colors/app_colors.dart';
import '../../../../Core/Utils/Text/text_style.dart';
import '../../../../Core/Utils/app_custom_widgets/custom_app_bottom.dart';
import '../../../HiringDriver/screens/Payment/payment_method_list_card.dart';
import 'custom_code_text_field.dart';

class PaymentButtomSheet extends StatelessWidget {
  const PaymentButtomSheet({super.key});

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
            'Change Address',
            style: AppTextStyles.style18BlueBold,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Divider(
              color: AppColors.grayColor,
              height: .7,
            ),
          ),
          const AutoSizeText(
            "If You have promo code you can get a Discount",
          ),
          const CodeTextField(),
          const PaymentMethodList(),
          Row(
            children: [
              CustomAppBottom(
                  onPressed: () {},
                  buttonText: "back",
                  buttonColor: AppColors.whiteColor,
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
                        return const PaymentButtomSheet();
                      },
                    );
                  },
                  buttonText: "done",
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
