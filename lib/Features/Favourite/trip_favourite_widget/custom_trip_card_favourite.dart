import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Features/Favourite/data/favorite_data_model.dart';
import 'package:taxi_go_user_version/Features/Favourite/trip_favourite_widget/custom_favorite_build_trip_details.dart';

class FavouriteCard extends StatelessWidget {
  final FavoriteRide favoriteRide;
  final Function() onPressed;
  const FavouriteCard({
    super.key,
    required this.onPressed,
    required this.favoriteRide,
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
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          child: Row(
            children: [
              Expanded(
                  child: CustomFavoriteBuildTripDetails(
                favoriteRide: favoriteRide,
              )),
            ],
          ),
        ),
        Positioned(
          top: 5.h,
          right: 1.w,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: Icon(
              size: 30.sp,
              Icons.star_rate_rounded,
              color: AppColors.yellowColor,
            ),
          ),
        )
      ],
    );
  }
}
