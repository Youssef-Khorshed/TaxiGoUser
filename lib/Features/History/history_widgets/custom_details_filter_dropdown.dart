import 'package:flutter/material.dart';

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
    'Today',
    'Yesterday',
    'Last 7 Days',
    'Last 30 Days',
    'This Month'
  ];

  String? selectedFilter = 'This Month';

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        child: CustomDropDownFormField(
          items: dateFilters,
          name: selectedFilter ?? ' This Month',
        ),
      ),
    );
  }
}
