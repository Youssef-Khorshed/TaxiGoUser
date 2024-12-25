import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            ? AutoSizeText(
                deposit ?? AppLocalizations.of(context)!.deposit_processing,
                style: AppTextStyles.style16BlackW600,
              )
            : AutoSizeText(
                withdrawal ??
                    AppLocalizations.of(context)!.withdrawal_processing,
                style: AppTextStyles.style18BlackW600,
              ),
        verticalSpace(5),
        Row(
          children: [
            AutoSizeText(
              amount ?? "1001",
              style: AppTextStyles.style18BlueBold,
            ),
            horizontalSpace(5),
            AutoSizeText(
              AppLocalizations.of(context)!.currency_iqd,
              style: AppTextStyles.style12DarkgrayW400,
            ),
          ],
        ),
      ],
    );
  }
}
