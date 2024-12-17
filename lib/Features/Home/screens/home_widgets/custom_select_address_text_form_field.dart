import 'package:flutter/material.dart';

class SelectAddressTextFormField extends StatelessWidget {
  final String labelText;
  final Widget? icon, suffixIcon;

  final bool isFrom;
  const SelectAddressTextFormField(
      {super.key,
      required this.labelText,
      required this.icon,
      this.isFrom = false,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 12,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          suffixIcon: isFrom ? suffixIcon : null,
          prefixIcon: icon,
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
