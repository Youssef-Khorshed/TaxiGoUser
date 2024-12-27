import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Features/Wallet/controller/wallet_deposit_cubit/deposit_cubit.dart';

import '../../../../Core/Utils/Colors/app_colors.dart';
import '../../../../Core/Utils/Spacing/app_spacing.dart';
import '../../../../Core/Utils/app_custom_widgets/custom_app_bottom.dart';

class WalletActionsButtonsWidget extends StatelessWidget {
  final WalletCubit walletCubit;
  const WalletActionsButtonsWidget({super.key, required this.walletCubit});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomAppBottom(
          buttonText: AppLocalizations.of(context)!.add_money,
          width: 100.w,
          borderCornerRadius: 12.r,
          onPressed: () async {
            if (walletCubit.formKey.currentState!.validate()) {
              await walletCubit.handleAddMoney(
                context: context,
                amount: walletCubit.amountController.text.trim(),
              );
            }
          },
        ),
        horizontalSpace(10),
        CustomAppBottom(
          buttonText: AppLocalizations.of(context)!.cancel,
          width: 100.w,
          borderCornerRadius: 12.r,
          borderColor: AppColors.redColor,
          buttonColor: AppColors.redColor.withAlpha(20),
          textColor: AppColors.redColor,
          onPressed: () async {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
