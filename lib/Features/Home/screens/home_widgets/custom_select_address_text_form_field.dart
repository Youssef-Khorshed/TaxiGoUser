// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';

// ignore: must_be_immutable
class SelectAddressTextFormField extends StatefulWidget {
  TextEditingController controller;
  TextInputType keyboardType;
  String hint;
  Color backgorundColor;
  Color bordercolor;
  Color errorbordercolor;
  Color focusedbordercolor;
  int borderRadius;
  int maxlines;
  TextStyle textStyle;
  TextStyle hinttextStyle;
  Widget? suffixicon;
  Widget? prefixicon;
  bool obscuretext;
  bool enabledborder;
  bool ispassword;
  FocusNode? focusNode;
  String? Function(String?)? validator;
  void Function(String?)? onSaved;
  void Function()? onTap;
  void Function(String)? onChanged;

  SelectAddressTextFormField({
    super.key,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.focusNode,
    required this.hint,
    this.backgorundColor = AppColors.whiteColor,
    this.bordercolor = AppColors.blueColor,
    this.errorbordercolor = AppColors.redColor,
    this.focusedbordercolor = AppColors.blueColor2,
    this.borderRadius = 12,
    this.maxlines = 1,
    required this.textStyle,
    required this.hinttextStyle,
    this.suffixicon,
    this.prefixicon,
    this.obscuretext = false,
    this.enabledborder = true,
    this.validator,
    this.onSaved,
    this.onTap,
    this.onChanged,
    this.ispassword = false,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomTextfieldState createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<SelectAddressTextFormField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscuretext;
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.focusNode,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      style: widget.textStyle,
      obscureText: _obscureText,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      validator: widget.validator,
      onSaved: widget.onSaved,
      maxLines: widget.maxlines,
      decoration: InputDecoration(
        hintText: widget.hint,
        prefixIcon: widget.prefixicon,
        suffixIcon: widget.ispassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: widget.bordercolor,
                ),
                onPressed: _toggleObscureText,
              )
            : widget.suffixicon,
        hintStyle: widget.hinttextStyle,
        filled: true,
        fillColor: widget.backgorundColor,
        enabled: widget.enabledborder,
        focusedBorder: getBorder(widget.focusedbordercolor),
        border: getBorder(widget.bordercolor),
        enabledBorder: getBorder(widget.bordercolor),
        errorBorder: getBorder(widget.errorbordercolor),
      ),
    );
  }

  OutlineInputBorder getBorder(Color bordercolor) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius.r),
      borderSide: BorderSide(color: bordercolor),
    );
  }
}
