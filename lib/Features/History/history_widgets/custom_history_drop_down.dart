import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Core/Utils/localization/cubit/local_cubit.dart';
import 'package:taxi_go_user_version/Features/History/controller/history_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomDetailsfilterdropdown extends StatefulWidget {
  const CustomDetailsfilterdropdown({
    super.key,
  });

  @override
  State<CustomDetailsfilterdropdown> createState() =>
      _CustomDetailsfilterdropdownState();
}

class _CustomDetailsfilterdropdownState
    extends State<CustomDetailsfilterdropdown> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> items = [
      AppLocalizations.of(context)!.today,
      AppLocalizations.of(context)!.yesterday,
      AppLocalizations.of(context)!.last_7_days,
      AppLocalizations.of(context)!.this_month,
    ];
    return DropdownButton2(
      underline: const SizedBox(),
      isExpanded: true,
      iconStyleData:
          const IconStyleData(iconEnabledColor: AppColors.whiteColor),
      buttonStyleData: ButtonStyleData(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: [AppColors.blueColor, AppColors.blueColor2]),
            color: AppColors.whiteColor,
            border: Border.all(color: AppColors.whiteColor, width: 1),
            borderRadius: BorderRadius.circular(10)),
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        useSafeArea: true,
      ),
      hint: AutoSizeText(
        context.read<HistoryViewModel>().selectedValue ?? items.first,
        style: AppTextStyles.style16WhiteW500,
        textAlign: TextAlign.center,
      ),
      items: items
          .map((gender) => DropdownMenuItem(value: gender, child: Text(gender)))
          .toList(),
      onChanged: (value) {
        HistoryViewModel.get(context).changeDropDownItem(value!);

        HistoryViewModel.get(context)
            .getHistoryData(context, tripHistory: convert(value));
      },
    );
  }

  String convert(String value) {
    switch (value) {
      case 'Today':
      case 'اليوم':
        return 'day';
      case 'Yesterday':
      case 'الامس':
        return 'yesterday';
      case 'Last 7 days':
      case 'اخر ٧ ايام':
        return 'week';
      case 'This month':
      case 'هذا الشهر':
        return 'month';
      default:
        return value; // Default case if no match
    }
  }
}
