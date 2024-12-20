import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Features/History/data/history_data_model.dart';
import 'package:taxi_go_user_version/Features/History/history_widgets/custom_BuildAdressRow%5B1%5D.dart';
import 'package:taxi_go_user_version/Features/History/history_widgets/custom_driver_details_history.dart';

class CustomBuildTripDetails extends StatelessWidget {
  final bool hasIcon;
  final String rating;
  final String price;
  final HistoryData historyData;

  const CustomBuildTripDetails(
      {super.key,
      required this.hasIcon,
      required this.rating,
      required this.price,
      required this.historyData});

  @override
  Widget build(BuildContext context) {
    return _buildTripDetails();
  }

  Widget _buildTripDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(
              top: hasIcon ? 50.h : 10.h, bottom: 5.h, right: 10.w, left: 10.w),
          color: AppColors.whiteColor2,
          child: BuildAddressRow(
            rideDetails: historyData,
          ),
        ),
        Container(
          width: double.infinity,
          height: 1,
          color: AppColors.darkgrayColor,
        ),
        CustomDriverdetailsHistory(
          rate: rating,
          price: price,
        ),
      ],
    );
  }
}
