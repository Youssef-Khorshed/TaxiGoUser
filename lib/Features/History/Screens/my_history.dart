import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Features/History/history_widgets/custom_details_filter_dropdown.dart';
import 'package:taxi_go_user_version/Features/History/history_widgets/custom_trip_card_history.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Spacer(),
                  CustomDetailsfilterdropdown(),
                ],
              ),
            ),
            verticalSpace(16),
            Expanded(
              child: ListView(
                children: const [
                  TripCard(
                    from: 'State Park',
                    to: 'Home',
                    timeFrom: '7:34 AM',
                    timeTo: '7:48 AM',
                    driverName: 'Mohamed Haggag',
                    rating: 4.9,
                    price: '\$9.00',
                  ),
                  TripCard(
                    from: 'Home',
                    to: 'Office',
                    timeFrom: '6:30 AM',
                    timeTo: '6:47 AM',
                    driverName: 'Mohamed Haggag',
                    rating: 4.9,
                    price: '\$9.00',
                  ),
                  TripCard(
                    from: 'OM University',
                    to: 'Home',
                    timeFrom: '11:24 AM',
                    timeTo: '11:52 AM',
                    driverName: 'Mohamed Haggag',
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
