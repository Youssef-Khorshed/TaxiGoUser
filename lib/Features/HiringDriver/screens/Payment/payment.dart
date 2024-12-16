import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Features/HiringDriver/screens/hiring_widgets/custom_buildrowdetail_hiring.dart';
import 'package:taxi_go_user_version/Features/HiringDriver/screens/hiring_widgets/custom_button_hiring.dart';
import 'package:taxi_go_user_version/Features/HiringDriver/screens/Payment/payment_method_list_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoutes.cancelbooing);
          },
        ),
        title: AutoSizeText(
          AppLocalizations.of(context)!.payment,
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
                        AppLocalizations.of(context)!.current_location,
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
                            '1.1 ${AppLocalizations.of(context)!.km}',
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
              AppLocalizations.of(context)!.payment_details,
              style: AppTextStyles.style16BlackW600,
            ),
            verticalSpace(size.height * 0.01),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Buildrowdetail(
                    label: AppLocalizations.of(context)!.distance,
                    value: '\$200'),
                Buildrowdetail(
                    label: AppLocalizations.of(context)!.time, value: '\$20'),
                Buildrowdetail(
                    label: AppLocalizations.of(context)!.promo_code,
                    value: '\$20'),
                Buildrowdetail(
                  label: AppLocalizations.of(context)!.total,
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
                  AppLocalizations.of(context)!.select_payment_method,
                  style: AppTextStyles.style16BlackW600,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            verticalSpace(10),
            const PaymentMethodList(),
            AppButton(
                text: AppLocalizations.of(context)!.confirm,
                height: size.height * 0.01,
                circlesize: 8,
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.rate);
                })
          ],
        ),
      ),
    );
  }
}
