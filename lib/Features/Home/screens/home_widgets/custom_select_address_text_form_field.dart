import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 12.h,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          suffixIcon: isFrom ? suffixIcon : null,
          prefixIcon: icon,
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0.r),
          ),
        ),
      ),
    );
  }
}
