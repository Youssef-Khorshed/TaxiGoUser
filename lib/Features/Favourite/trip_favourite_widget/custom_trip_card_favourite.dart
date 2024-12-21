import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Features/Favourite/data/favorite_data_model.dart';
import 'package:taxi_go_user_version/Features/Favourite/trip_favourite_widget/custom_favorite_build_trip_details.dart';

class FavouriteCard extends StatelessWidget {
  final RideRequestData rideData;
  final int distance;
  const FavouriteCard({
    super.key,
    required this.rideData,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Card(
          elevation: 8,
          shadowColor: AppColors.grayColor,
          color: AppColors.whiteColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Row(
            children: [
              Expanded(
                  child: CustomFavoriteBuildTripDetails(
                rideData: rideData,
                distance: distance,
              )),
            ],
          ),
        ),
        Positioned(
          top: 5,
          right: 1,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              size: 30,
              Icons.star_rate_rounded,
              color: AppColors.yellowColor,
            ),
          ),
        )
      ],
    );
  }
}
