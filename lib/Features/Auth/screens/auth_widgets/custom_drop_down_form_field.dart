import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import '../../../../Core/Utils/Colors/app_colors.dart';

class CustomDropDownFormField extends StatelessWidget {
  final List<String> items;
  final String name;
  const CustomDropDownFormField(
      {super.key, required this.items, required this.name});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      child: DropdownButton2(
        underline: Container(
          color: Colors.transparent,
        ),
        isExpanded: true,
        buttonStyleData: ButtonStyleData(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(10)),
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          useSafeArea: true,
          width: MediaQuery.of(context).size.width * 0.4,
        ),
        hint: AutoSizeText(
          name,
          style: AppTextStyles.style14BlackW500,
          textAlign: TextAlign.center,
        ),
        items: items
            .map((gender) =>
                DropdownMenuItem(value: gender, child: Text(gender)))
            .toList(),
        onChanged: (value) {},
      ),
    );
  }
}
