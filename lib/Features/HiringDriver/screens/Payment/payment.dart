import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_buildrowdetail_hiring.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/payment_method_list_card.dart';

import '../../../../Core/Utils/app_custom_widgets/custom_app_bottom.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoutes.cancelbooing);
          },
        ),
        title: AutoSizeText(
          'Payment',
          style: AppTextStyles.style18BlackW500,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05,
          vertical: size.height * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Location section
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const Icon(Icons.location_pin, color: Colors.red),
                    Container(
                      height: 60,
                      width: 1,
                      color: Colors.grey,
                    ),
                    const Icon(Icons.location_pin, color: Colors.blue),
                  ],
                ),
                verticalSpace(size.width * 0.03),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        'Current location',
                        style: AppTextStyles.style16DarkgrayW500,
                      ),
                      AutoSizeText(
                        '2972 Westheimer Rd. Santa Ana, Illinois 85486',
                        style: AppTextStyles.style14GrayW500,
                      ),
                      verticalSpace(size.height * 0.02),
                      AutoSizeText(
                        'Office',
                        style: AppTextStyles.style16DarkgrayW500,
                      ),
                      Row(
                        children: [
                          AutoSizeText(
                            '1901 Thornridge Cir. Shiloh, Hawaii 81063',
                            style: AppTextStyles.style14GrayW500,
                          ),
                          const Spacer(),
                          AutoSizeText(
                            '1.1km',
                            style: AppTextStyles.style14GrayW500,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            verticalSpace(size.height * 0.03),

            // Payment Details
            AutoSizeText(
              'Payment Detail',
              style: AppTextStyles.style16BlackW600,
            ),
            verticalSpace(size.height * 0.01),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Buildrowdetail(label: 'Distance', value: '\$200'),
                Buildrowdetail(label: 'Time', value: '\$20'),
                Buildrowdetail(label: 'Promo Code', value: '\$20'),
                Buildrowdetail(
                  label: 'Total',
                  value: '\$220',
                  isBold: true,
                ),
              ],
            ),

            verticalSpace(size.height * 0.02),

            // Payment Method Section
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AutoSizeText(
                  'Select payment method',
                  style: AppTextStyles.style16BlackW600,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            verticalSpace(10),
            const PaymentMethodList(),
            CustomAppBottom(
                buttonText: 'Confirm',
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.rate);
                })
          ],
        ),
      ),
    );
  }
}
