import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Features/Wallet/screens/wallet_widgets/cutom_sheet_wallet.dart';

class BankAccountCardWidget extends StatelessWidget {
  const BankAccountCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        verticalSpace(screenHeight * 0.07),
        AutoSizeText("You Should Add bank Account .",
            style: AppTextStyles.style18RedW500),
        verticalSpace(screenHeight * 0.06),
        Container(
          padding: EdgeInsets.all(screenWidth * 0.04),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(screenWidth * 0.03),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "BANK ACCOUNT & CARDS",
                    style: AppTextStyles.style16BlackW600,
                  ),
                  const Icon(
                    Icons.edit,
                    size: 25,
                    color: AppColors.blueColor,
                  ),
                ],
              ),
              verticalSpace(screenHeight * 0.02),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.account_balance,
                    color: AppColors.blueColor,
                    size: 40,
                  ),
                  horizontalSpace(screenWidth * 0.03),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        "STATE BANK OF iq",
                        style: AppTextStyles.style16BlackW600,
                      ),
                      AutoSizeText(
                        "Primary account",
                        style: AppTextStyles.style16DarkgrayW500,
                      ),
                      verticalSpace(screenHeight * 0.01),
                      AutoSizeText(
                        "Delete",
                        style: AppTextStyles.style12RedW500,
                      ),
                    ],
                  ),
                  const Spacer(),
                  AutoSizeText(
                    "...1234",
                    style: AppTextStyles.style16BlackW600,
                  ),
                ],
              ),
              verticalSpace(screenHeight * 0.006),
              GestureDetector(
                onTap: () {
                  // Handle Add Bank Account
                },
                child: Container(
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.grayColor),
                    borderRadius: BorderRadius.circular(screenWidth * 0.03),
                  ),
                  child: InkWell(
                    onTap: () => showWalletSheet(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          size: screenWidth * 0.06,
                          color: AppColors.grayColor,
                        ),
                        verticalSpace(screenWidth * 0.02),
                        AutoSizeText(
                          "ADD BANK ACCOUNT",
                          style: AppTextStyles.style16GrayW500,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
