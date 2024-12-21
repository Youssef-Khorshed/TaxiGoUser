import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Features/Favourite/data/favorite_data_model.dart';
import 'package:taxi_go_user_version/Features/Favourite/trip_favourite_widget/custom_favorite_adress_row.dart';
import 'package:taxi_go_user_version/Features/History/history_widgets/custom_driver_details_history.dart';

class CustomFavoriteBuildTripDetails extends StatelessWidget {
  const CustomFavoriteBuildTripDetails(
      {super.key, required this.rideData, required this.favoriteRide});
  final RideRequestData rideData;
  final FavoriteRide favoriteRide;

  @override
  Widget build(BuildContext context) {
    return _buildTripDetails();
  }

  Widget _buildTripDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding:
              EdgeInsets.only(top: 20.h, bottom: 5.h, right: 10.w, left: 10.w),
          color: AppColors.whiteColor2,
          child: CustomFavBuildAddressRow(
              rideDetails: rideData, distance: favoriteRide.distance!),
        ),
        Container(
          width: double.infinity,
          height: 1,
          color: AppColors.darkgrayColor,
        ),
        CustomDriverdetailsHistory(
          price: favoriteRide.total!,
          rating: favoriteRide.rate!,
        ),
      ],
    );
  }
}
