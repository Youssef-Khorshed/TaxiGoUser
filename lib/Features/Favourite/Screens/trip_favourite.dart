import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import '../trip_favourite_widget/custom_trip_card_favourite.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

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
                  FavouriteCard(
                    from: 'State Park',
                    to: 'Home',
                    timeFrom: '7:34 AM',
                    timeTo: '7:48 AM',
                    driverName: 'Mohamed Haggag',
                    rating: 4.9,
                    price: '\$9.00',
                  ),
                  FavouriteCard(
                    from: 'Home',
                    to: 'Office',
                    timeFrom: '6:30 AM',
                    timeTo: '6:47 AM',
                    driverName: 'Mohamed Haggag',
                    rating: 4.9,
                    price: '\$9.00',
                  ),
                  FavouriteCard(
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
