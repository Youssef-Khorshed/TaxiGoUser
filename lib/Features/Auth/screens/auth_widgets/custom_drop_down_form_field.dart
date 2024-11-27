import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';

class CustomDropDownFormField extends StatelessWidget {
  final List<String> items;
  final String name;
  const CustomDropDownFormField(
      {super.key, required this.items, required this.name});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DropdownButton2(
        underline: Container(
          color: Colors.transparent,
        ),
        isExpanded: true,
        iconStyleData: const IconStyleData(
            icon: Icon(
          Icons.keyboard_arrow_down,
          color: AppColors.whiteColor,
        )),
        buttonStyleData: ButtonStyleData(
          decoration: BoxDecoration(
              color: AppColors.blueColor,
              border: Border.all(color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(10)),
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          useSafeArea: true,
          width: MediaQuery.of(context).size.width * 0.4,
        ),
        hint: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: AutoSizeText(
            name,
            style: AppTextStyles.style14BlackW500
                .copyWith(color: AppColors.whiteColor),
          ),
        ),
        items: items
            .map((name) => DropdownMenuItem(value: name, child: Text(name)))
            .toList(),
        onChanged: (value) {},
      ),
    );
  }
}
