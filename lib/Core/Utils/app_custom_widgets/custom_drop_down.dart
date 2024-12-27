import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Features/History/controller/history_view_model.dart';

// ignore: must_be_immutable
class CustomDropDownFormField extends StatelessWidget {
  final List<String> items;
  final String name;
  final Color? backgroundcolor;
  final Color bordercolor;
  final Color? iconEnabledColor;
  final Gradient? gradient;
  final TextStyle? nameTextStyle;
  const CustomDropDownFormField(
      {super.key,
      required this.items,
      required this.name,
      this.gradient,
      this.iconEnabledColor,
      this.nameTextStyle,
      this.bordercolor = AppColors.blackColor,
      this.backgroundcolor});

  @override
  Widget build(BuildContext context) {
    String? selectedValue;
    return DropdownButton2(
      underline: const SizedBox(),
      isExpanded: true,
      iconStyleData: IconStyleData(iconEnabledColor: iconEnabledColor),
      buttonStyleData: ButtonStyleData(
        decoration: BoxDecoration(
            gradient: gradient,
            color: backgroundcolor,
            border: Border.all(color: bordercolor, width: 1),
            borderRadius: BorderRadius.circular(10)),
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        useSafeArea: true,
      ),
      hint: AutoSizeText(
        selectedValue ?? name,
        style: nameTextStyle,
        textAlign: TextAlign.center,
      ),
      items: items
          .map((gender) =>
              DropdownMenuItem(value: gender, child: AutoSizeText(gender)))
          .toList(),
      onChanged: (value) {
        selectedValue = value;
        HistoryViewModel.get(context)
            .getHistoryData(context, tripHistory: value);
      },
    );
  }
}
