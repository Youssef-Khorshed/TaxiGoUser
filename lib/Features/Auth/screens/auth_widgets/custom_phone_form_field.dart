import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_go_user_version/Core/Utils/Assets/icons/app_icons.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';

class CustomPhoneFormField extends StatelessWidget {
  const CustomPhoneFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        labelText: 'Your mobile number',
        labelStyle: AppTextStyles.style16WhiteW500
            .copyWith(fontSize: 14, color: AppColors.grayColor),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.blackColor, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.blueColor, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.redColor, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        errorMaxLines: 1,
        errorStyle: AppTextStyles.style16WhiteW500
            .copyWith(fontSize: 14, color: AppColors.redColor),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(right: 8.0, left: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 24,
                height: 16,
                child: SvgPicture.asset(
                  AppIcons.iraqiFlagIcon,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 8),
              AutoSizeText('+964',
                  style: AppTextStyles.style16WhiteW500
                      .copyWith(color: AppColors.blackColor)),
            ],
          ),
        ),
      ),
    );
  }
}
