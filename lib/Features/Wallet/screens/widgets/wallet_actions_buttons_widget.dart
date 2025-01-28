import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Features/Wallet/controller/wallet_deposit_cubit/deposit_cubit.dart';
import '../../../../Core/Utils/Colors/app_colors.dart';
import '../../../../Core/Utils/Spacing/app_spacing.dart';
import '../../../../Core/Utils/app_custom_widgets/custom_app_bottom.dart';

class WalletActionsButtonsWidget extends StatefulWidget {
  final WalletCubit walletCubit;

  const WalletActionsButtonsWidget({super.key, required this.walletCubit});

  @override
  State<WalletActionsButtonsWidget> createState() =>
      _WalletActionsButtonsWidgetState();
}

class _WalletActionsButtonsWidgetState
    extends State<WalletActionsButtonsWidget> {
  bool _isLoading = false;

  void _handleAddMoney() {
    if (!mounted) return;
    if (!widget.walletCubit.formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    widget.walletCubit
        .handleAddMoney(
      context: context,
      amount: widget.walletCubit.amountController.text.trim(),
    )
        .catchError((e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }).whenComplete(() {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: CustomAppBottom(
            fontSize: 16.sp,
            buttonText: AppLocalizations.of(context)!.add_money,
            borderCornerRadius: 20.r,
            onPressed: _isLoading ? () {} : _handleAddMoney,
          ),
        ),
        horizontalSpace(10.h),
        Expanded(
          child: CustomAppBottom(
            buttonText: AppLocalizations.of(context)!.cancel,
            borderCornerRadius: 20.r,
            borderColor: AppColors.redColor,
            buttonColor: AppColors.redColor.withAlpha(10),
            textColor: AppColors.redColor,
            onPressed: _isLoading ? () {


            } : () => Navigator.of(context).pop(),
          ),
        ),
      ],
    );
  }
}
