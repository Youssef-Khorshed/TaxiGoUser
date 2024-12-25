import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import '../trip_favourite_widget/custom_trip_card_favourite.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

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
            Expanded(
              child: ListView(
                children: [
                  FavouriteCard(
                    from: AppLocalizations.of(context)!.state_park,
                    to: AppLocalizations.of(context)!.home,
                    timeFrom: '7:34 AM',
                    timeTo: '7:48 AM',
                    driverName: AppLocalizations.of(context)!.user_name,
                    rating: 4.9,
                    price: '\$9.00',
                  ),
                  FavouriteCard(
                    from: AppLocalizations.of(context)!.home,
                    to: AppLocalizations.of(context)!.office,
                    timeFrom: '6:30 AM',
                    timeTo: '6:47 AM',
                    driverName: AppLocalizations.of(context)!.user_name,
                    rating: 4.9,
                    price: '\$9.00',
                  ),
                  FavouriteCard(
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
