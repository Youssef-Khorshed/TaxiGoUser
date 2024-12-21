import 'package:flutter/material.dart';
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

  final List<Map<String, dynamic>> rideTypes = [
    {'title': 'Economy', 'icon': Icons.directions_car},
    {'title': 'VIP', 'icon': Icons.directions_car_filled},
    {'title': 'Airport', 'icon': Icons.directions_car},
    {'title': 'Between country', 'icon': Icons.directions_car},
  ];

  @override
  Widget build(BuildContext context) {
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
            padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.w),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.blueColor : AppColors.whiteColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey),
            ),
            child: Column(
              children: [
                Icon(
                  rideTypes[index]['icon'],
                  color: isSelected ? Colors.white : Colors.black,
                ),
                verticalSpace(4.h),
                Text(
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
