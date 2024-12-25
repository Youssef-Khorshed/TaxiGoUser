import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Features/Wallet/screens/widgets/transactions_list_widgte.dart';
import '../../../Core/Utils/Colors/app_colors.dart';
import 'widgets/available_balance_list_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RSizedBox.vertical(30.h),
            Center(
              child: AutoSizeText(AppLocalizations.of(context)!.wallet,
                  style: AppTextStyles.style16BlackW600),
            ),
            RSizedBox.vertical(10.h),
            const AvailableBalanceListWidget(),
            verticalSpace(10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: AutoSizeText(AppLocalizations.of(context)!.transactions,
                  style: AppTextStyles.style16BlackW600),
            ),
            verticalSpace(10.h),
            const Expanded(
              child: TransactionsListWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
