import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_user_version/Features/History/history_widgets/custom_history_drop_down.dart';

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

  @override
  Widget build(BuildContext context) {
    final List<String> dateFilters = [
      AppLocalizations.of(context)!.today,
      AppLocalizations.of(context)!.yesterday,
      AppLocalizations.of(context)!.last_7_days,
      AppLocalizations.of(context)!.last_30_days,
      AppLocalizations.of(context)!.this_month,
    ];

    return CustomHistoryDropDown(
      items: dateFilters,
      iconEnabledColor: AppColors.whiteColor,
      bordercolor: AppColors.transparentColor,
      nameTextStyle: AppTextStyles.style16WhiteW500,
      gradient: const LinearGradient(
          colors: [AppColors.blueColor, AppColors.blueColor2]),
    );
  }
}
