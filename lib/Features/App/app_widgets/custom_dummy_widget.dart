import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Assets/icons/app_icons.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Features/Favourite/trip_favourite_widget/favorite_trip_details_map.dart';
import 'package:taxi_go_user_version/Features/History/history_widgets/custom_driver_details_history.dart';

class CustomDummyWidget extends StatelessWidget {
  final Function() onPressed;
  const CustomDummyWidget({
    super.key,
    required this.onPressed,
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
          child: const Row(
            children: [
              Expanded(
                child: DummyBuildTripDetails(),
              ),
            ],
          ),
        ),
        Positioned(
          top: 5,
          right: 1,
          child: IconButton(
            onPressed: onPressed,
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

class DummyBuildTripDetails extends StatelessWidget {
  const DummyBuildTripDetails({super.key});

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
          child: const LcationRow(),
        ),
        Container(
          width: double.infinity,
          height: 1,
          color: AppColors.darkgrayColor,
        ),
        const CustomDriverdetailsHistory(
          price: '55',
          rating: '2.5',
          name: '',
        ),
      ],
    );
  }
}

class LcationRow extends StatelessWidget {
  const LcationRow({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FavoriteTripDetailsMap(
            address: 'fromAddress',
            location: 'fromCity',
            icon: AppIcons.menuIcon,
          ),
          FavoriteTripDetailsMap(
            address: 'toAddress',
            location: 'toCity',
            icon: AppIcons.menuIcon,
          ),
        ],
      ),
      trailing: Text(
        '',
        style: TextStyle(fontSize: 15.sp),
      ),
    );
  }
}
