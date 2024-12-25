import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Core/Utils/app_custom_widgets/custom_drop_down.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    'Today',
    'Yesterday',
    'Last 7 Days',
    'Last 30 Days',
    'This Month'
  ];

  String? selectedFilter = 'This Month';

  @override
  Widget build(BuildContext context) {
    return CustomDropDownFormField(
      items: dateFilters,
      iconEnabledColor: AppColors.whiteColor,
      bordercolor: AppColors.transparentColor,
      nameTextStyle: AppTextStyles.style16WhiteW500,
      gradient: const LinearGradient(
          colors: [AppColors.blueColor, AppColors.blueColor2]),
      name: selectedFilter ?? AppLocalizations.of(context)!.today,
    );
  }
}
