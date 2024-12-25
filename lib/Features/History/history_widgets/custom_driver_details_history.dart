import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';

class CustomDriverdetailsHistory extends StatelessWidget {
  const CustomDriverdetailsHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildDriverDetails();
  }

  Widget _buildDriverDetails() {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: AppColors.grayColor,
        radius: 20.r,
      ),
      title: AutoSizeText(
        'Mohamed haggag',
        style: AppTextStyles.style18BlackW500,
        maxLines: 1,
      ),
      subtitle: Row(
        children: [
          Icon(Icons.star, size: 16.sp, color: Colors.amber),
          AutoSizeText(
            '4.9',
            style: AppTextStyles.style14GrayW500,
            maxLines: 1,
          ),
        ],
      ),
      trailing: _buildPrice(),
    );
  }

  Widget _buildPrice() {
    return Column(
      children: [
        AutoSizeText(
          'Price',
          style: AppTextStyles.style14DarkgrayW500,
        ),
        AutoSizeText(
          '\$ 9.30',
          style: AppTextStyles.style14BlackW500,
        ),
      ],
    );
  }
}
