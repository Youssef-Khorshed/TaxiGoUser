import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Features/HiringDriver/screens/hiring_widgets/custom_button_hiring.dart';
import 'package:taxi_go_user_version/Features/Wallet/screens/wallet_widgets/cutom_method_card_wallet.dart';

class PaymentMethodWidget extends StatelessWidget {
  const PaymentMethodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize
            .min, // Ensures the widget takes only as much space as needed
        children: [
          const AutoSizeText(
            "Select Payment Method",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
          verticalSpace(20),
          const WalletMethodCard(),
          verticalSpace(30),
          AppButton(
            text: 'Next',
            height: 10,
            circlesize: 24,
            onPressed: () {
              Navigator.pop(context);
              //   Navigator.of(context).pushNamed(AppRoutes.payment);
            },
          )
        ],
      ),
    );
  }
}
