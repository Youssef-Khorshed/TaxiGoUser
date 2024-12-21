import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomDriverdetailsHistory extends StatelessWidget {
  const CustomDriverdetailsHistory(
      {super.key, required this.price, required this.rating});
  final String price;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return _buildDriverDetails(context);
  }

  Widget _buildDriverDetails(BuildContext context) {
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
          const Icon(Icons.star, size: 16, color: AppColors.amberColor),
          AutoSizeText(
            rating,
            style: AppTextStyles.style14GrayW500,
            maxLines: 1,
          ),
        ],
      ),
      trailing: _buildPrice(context),
    );
  }

  Widget _buildPrice(BuildContext context) {
    return Column(
      children: [
        AutoSizeText(
          AppLocalizations.of(context)!.price,
          style: AppTextStyles.style14DarkgrayW500,
        ),
        AutoSizeText(
          ' $price ${AppLocalizations.of(context)!.iqd}',
          style: AppTextStyles.style14BlackW500,
        ),
      ],
    );
  }
}
