import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';

class CustomDetailsfilterdropdown extends StatefulWidget {
  const CustomDetailsfilterdropdown({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomDetailsfilterdropdownState createState() =>
      _CustomDetailsfilterdropdownState();
}

class _CustomDetailsfilterdropdownState
    extends State<CustomDetailsfilterdropdown> {
  // Define the list of date filter options
  final List<String> dateFilters = [
    'This Month',
    'Last Month',
    'This Week',
    'Last Week',
  ];

  // The currently selected date filter
  String? selectedFilter = 'This Month';

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: 150,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [AppColors.blueColor, AppColors.blueColor2]),
          borderRadius: BorderRadius.circular(20),
        ),
        child: DropdownButton<String>(
          value: selectedFilter,
          icon: const Icon(Icons.arrow_drop_down, color: AppColors.whiteColor),
          iconSize: 24,
          elevation: 16,
          style: AppTextStyles.style20WhiteW600,
          onChanged: (String? newValue) {
            setState(() {
              selectedFilter = newValue!;
            });
          },
          underline: Container(),
          isExpanded: true,
          items: dateFilters.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: AutoSizeText(
                value,
                style: AppTextStyles.style24WhiteW500,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
