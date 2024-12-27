import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../Core/Utils/Spacing/app_spacing.dart';
import '../../../../Core/Utils/Text/text_style.dart';

class WithdrawalDepositTimeWidget extends StatelessWidget {
  final DateTime dateTime;

  const WithdrawalDepositTimeWidget({
    super.key,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    final time = DateFormat('hh:mm a').format(dateTime);
    final date = DateFormat('dd/MM/yyyy').format(dateTime);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        AutoSizeText(
          time,
          style: AppTextStyles.style12DarkgrayW400,
        ),
        verticalSpace(10),
        AutoSizeText(
          date,
          style: AppTextStyles.style12DarkgrayW400,
        ),
      ],
    );
  }
}
