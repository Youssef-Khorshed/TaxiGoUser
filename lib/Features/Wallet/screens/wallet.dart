import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Features/HiringDriver/screens/hiring_widgets/custom_button_hiring.dart';
import 'package:taxi_go_user_version/Features/Wallet/screens/wallet_widgets/custom_bank_account_card_wallet.dart';
import 'package:taxi_go_user_version/Features/Wallet/screens/wallet_widgets/cutom_sheet_wallet.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 3,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(screenWidth * 0.05),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(screenWidth * 0.03),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText("Available Balance",
                        style: AppTextStyles.style16DarkgrayW500),
                    SizedBox(height: screenHeight * 0.01),
                    AutoSizeText(
                      "5623 \$",
                      style: AppTextStyles.style24BlackW500,
                    ),
                  ],
                ),
              ),
            ),
            verticalSpace(screenHeight * 0.01),
            const BankAccountCardWidget(),
            const Spacer(),
            AppButton(
              text: 'Add Money',
              height: screenHeight * 0.01,
              circlesize: 24,
              onPressed: () {
                showWalletSheet(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
