import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Features/Wallet/screens/widgets/transactions_list_widgte.dart';
import '../../../Core/Utils/Colors/app_colors.dart';
import 'widgets/available_balance_list_widget.dart';

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
            const AvailableBalanceListWidget(),
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
