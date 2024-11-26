import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Features/Saved/tripSaved_widget/custom_tripCard_saved.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

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
            Expanded(
              child: ListView(
                children: const [
                  SavedCard(
                    from: 'State Park',
                    to: 'Home',
                    timeFrom: '7:34 AM',
                    timeTo: '7:48 AM',
                    driverName: 'Mohamed Haggag',
                    rating: 4.9,
                    price: '\$9.00',
                  ),
                  SavedCard(
                    from: 'Home',
                    to: 'Office',
                    timeFrom: '6:30 AM',
                    timeTo: '6:47 AM',
                    driverName: 'Mohamed Haggag',
                    rating: 4.9,
                    price: '\$9.00',
                  ),
                  SavedCard(
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
