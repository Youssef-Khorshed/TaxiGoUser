import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';

// ignore: must_be_immutable
class CustomRidetypeselector extends StatefulWidget {
  Function(int) onRideTypeSelected;
  CustomRidetypeselector({super.key, required this.onRideTypeSelected});

  @override
  // ignore: library_private_types_in_public_api
  _CustomRidetypeselectorState createState() => _CustomRidetypeselectorState();
}

class _CustomRidetypeselectorState extends State<CustomRidetypeselector> {
  int selectedRideIndex = 0; // Track the selected ride index

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> rideTypes = [
      {
        'title': AppLocalizations.of(context)!.economy,
        'icon': Icons.directions_car
      },
      {
        'title': AppLocalizations.of(context)!.vip,
        'icon': Icons.directions_car_filled
      },
      {
        'title': AppLocalizations.of(context)!.airport,
        'icon': Icons.directions_car
      },
      {
        'title': AppLocalizations.of(context)!.between_country,
        'icon': Icons.directions_car
      },
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(rideTypes.length, (index) {
        bool isSelected = selectedRideIndex == index;
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedRideIndex = index;
              widget.onRideTypeSelected(selectedRideIndex);
            });
          },
          child: Container(
            width: 80.w,
            padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 8.w),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.blueColor : AppColors.whiteColor,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AppColors.grayColor),
            ),
            child: Column(
              children: [
                Icon(
                  rideTypes[index]['icon'],
                  color: isSelected ? Colors.white : Colors.grey,
                ),
                verticalSpace(4.h),
                AutoSizeText(
                  rideTypes[index]['title'],
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
