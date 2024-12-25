import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Features/History/history_widgets/custom_details_filter_dropdown.dart';
import 'package:taxi_go_user_version/Features/History/history_widgets/custom_trip_card_history.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../Core/Utils/Text/text_style.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(20.r)),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: AutoSizeText("History",
                        style: AppTextStyles.style20WhiteW600
                            .copyWith(color: AppColors.blackColor))),
                const Expanded(child: CustomDetailsfilterdropdown()),
              ],
            ),
            verticalSpace(16),
            Expanded(
              child: ListView(
                children: [
                  TripCard(
                    from: AppLocalizations.of(context)!.state_park,
                    to: AppLocalizations.of(context)!.home,
                    timeFrom: '7:34 AM',
                    timeTo: '7:48 AM',
                    driverName: AppLocalizations.of(context)!.user_name,
                    rating: 4.9,
                    price: '\$9.00',
                  ),
                  TripCard(
                    from: AppLocalizations.of(context)!.home,
                    to: AppLocalizations.of(context)!.office,
                    timeFrom: '6:30 AM',
                    timeTo: '6:47 AM',
                    driverName: AppLocalizations.of(context)!.user_name,
                    rating: 4.9,
                    price: '\$9.00',
                  ),
                  TripCard(
                    from: AppLocalizations.of(context)!.oM_university,
                    to: AppLocalizations.of(context)!.home,
                    timeFrom: '11:24 AM',
                    timeTo: '11:52 AM',
                    driverName: AppLocalizations.of(context)!.user_name,
                    rating: 4.9,
                    price: '\$9.00',
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
