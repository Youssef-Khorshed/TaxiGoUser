import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Features/Wallet/screens/wallet_widgets/cutom_paymentMethod_wallet.dart';

void showWalletSheet(BuildContext context) {
  // final screenWidth = MediaQuery.of(context).size.width;
  // final screenHeight = MediaQuery.of(context).size.height;
  // bool change = true; // use it to switch between widgets
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return const Padding(
          padding: EdgeInsets.all(20), child: PaymentMethodWidget());
    },
  );
}
