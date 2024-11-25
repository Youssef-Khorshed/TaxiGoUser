import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';

import '../../../../../Core/Utils/Text/text_style.dart';

class CustomLogInFormField extends StatefulWidget {
  final String? hintText;
  final bool obscureText, isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  const CustomLogInFormField(
      {super.key,
      this.hintText,
      required this.obscureText,
      required this.isPassword,
      this.controller,
      this.validator,
      this.onTap});

  @override
  State<CustomLogInFormField> createState() => _CustomLogInFormFieldState();
}

class _CustomLogInFormFieldState extends State<CustomLogInFormField> {
  bool isPasswordHidden = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isPassword && isPasswordHidden,
        keyboardType: TextInputType.text,
        validator: widget.validator,
        onTap: widget.onTap,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.grayColor, width: 1),
          ),
          hintText: widget.hintText,
          hintStyle: AppTextStyles.style16WhiteW500
              .copyWith(color: AppColors.grayColor),
          // suffixIcon: widget.isPassword
          //     ? IconButton(
          //         icon: SvgPicture.asset(
          //           isPasswordHidden
          //               ? "assets/icons/eye_off_icon.svg"
          //               : 'assets/icons/view.svg',
          //           height: 24,
          //           width: 24,
          //         ),
          //         onPressed: () {
          //           isPasswordHidden = !isPasswordHidden;
          //           setState(() {});
          //         },
          //       )
          //     : null,
        ),
      ),
    );
  }
}
