import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/Utils/Spacing/app_spacing.dart';
import '../../../../Core/Utils/Text/text_style.dart';

class WithdrawalDepositTextWidget extends StatelessWidget {
  final bool isDeposit;
  final String? deposit, withdrawal;
  final String? amount;
  const WithdrawalDepositTextWidget(
      {super.key,
      required this.isDeposit,
      this.deposit,
      this.withdrawal,
      this.amount});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isDeposit
            ? Text(
                deposit ?? AppLocalizations.of(context)!.deposit_processing,
                style: AppTextStyles.style16BlackW600.copyWith(
                  fontSize: 18.sp,
                ),
              )
            : Text(
                withdrawal ??
                    AppLocalizations.of(context)!.withdrawal_processing,
                style: AppTextStyles.style18BlackW600,
              ),
        verticalSpace(5),
        Row(
          children: [
            Text(
              amount ?? "1001",
              style: AppTextStyles.style18BlueBold,
            ),
            horizontalSpace(5),
            Text(
              AppLocalizations.of(context)!.currency_iqd,
              style: AppTextStyles.style12DarkgrayW400,
            ),
          ],
        ),
      ],
    );
  }
}
