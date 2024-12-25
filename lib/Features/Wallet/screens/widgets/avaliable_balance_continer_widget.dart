import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../Core/Utils/Colors/app_colors.dart';
import '../../../../Core/Utils/Spacing/app_spacing.dart';
import '../../../../Core/Utils/Text/text_style.dart';
import 'wallet_dialog_method.dart';

class AvaliableBalanceItemWidget extends StatelessWidget {
  final String amount;
  const AvaliableBalanceItemWidget({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.5,
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AutoSizeText(
              AppLocalizations.of(context)!.available_balance,
              style: AppTextStyles.style16BlackW600,
            ),
            Center(
              child: Row(
                children: [
                  AutoSizeText(
                    amount,
                    style: AppTextStyles.style18BlueBold,
                  ),
                  horizontalSpace(5.w),
                  AutoSizeText(
                    AppLocalizations.of(context)!.currency_iqd,
                    style: AppTextStyles.style12DarkgrayW400,
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      walletDialog(context);
                    },
                    child: Icon(
                      Icons.add,
                      size: 35.sp,
                      color: AppColors.blueColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
