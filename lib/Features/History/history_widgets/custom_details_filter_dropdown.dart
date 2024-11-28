import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';

import '../../Auth/screens/auth_widgets/custom_drop_down_form_field.dart';

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

  String? selectedFilter = 'This Month';

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        child: CustomDropDownFormField(
          items: dateFilters,
          name: selectedFilter ?? ' This Month',
        ),
      ),
    );
  }
}
