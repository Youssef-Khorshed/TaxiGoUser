import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';

class SavedCard extends StatelessWidget {
  final String from;
  final String to;
  final String timeFrom;
  final String timeTo;
  final String driverName;
  final double rating;
  final String price;

  const SavedCard({
    super.key,
    required this.from,
    required this.to,
    required this.timeFrom,
    required this.timeTo,
    required this.driverName,
    required this.rating,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Card(
          elevation: 2,
          shadowColor: AppColors.blackColor,
          color: AppColors.whiteColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          child: const Row(
            children: [
              // Expanded(
              //     child: CustomBuildTripDetails(
              //   from: '',
              //   to: '',
              //   timeFrom: '',
              //   timeTo: '',
              //   driverName: '',
              //   rating: '',
              //   price: '',
              //   hasIcon: true,
              // )),
            ],
          ),
        ),
        Positioned(
          top: 1,
          right: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.star_border,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 1,
          left: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.bookmark_outline,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
