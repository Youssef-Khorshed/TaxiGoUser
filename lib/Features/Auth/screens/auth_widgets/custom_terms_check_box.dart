import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';

class CustomTermsCheckBox extends StatelessWidget {
  final bool isChecked;
  final Function(bool?) onChanged;
  const CustomTermsCheckBox({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildIconButton(),
        _buildTermsText(),
      ],
    );
  }

  Widget _buildIconButton() {
    return IconButton(
      icon: Icon(
        isChecked ? FontAwesomeIcons.circleCheck : FontAwesomeIcons.circle,
        color: isChecked ? AppColors.blueColor : AppColors.grayColor,
        size: 24,
      ),
      onPressed: () => onChanged(!isChecked),
    );
  }

  Widget _buildTermsText() {
    return Expanded(
      child: Text.rich(
        TextSpan(
          text: 'By signing up, you agree to the ',
          style: AppTextStyles.style16WhiteW500
              .copyWith(color: AppColors.grayColor, fontSize: 14),
          children: [
            TextSpan(
              text: 'Terms of service',
              style: AppTextStyles.style16WhiteW500
                  .copyWith(color: AppColors.blueColor, fontSize: 14),
            ),
            TextSpan(
              text: ' and ',
              style: AppTextStyles.style16WhiteW500
                  .copyWith(color: AppColors.grayColor, fontSize: 14),
            ),
            TextSpan(
              text: 'Privacy policy.',
              style: AppTextStyles.style16WhiteW500
                  .copyWith(color: AppColors.blueColor, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
