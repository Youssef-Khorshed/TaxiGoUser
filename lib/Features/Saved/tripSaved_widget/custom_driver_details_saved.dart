import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_user_version/Features/Saved/data/saved_data_model.dart';

class CustomDriverDetailsSaved extends StatelessWidget {
  const CustomDriverDetailsSaved(
      {super.key,
      required this.rate,
      required this.price,
      required this.saveCaptain});
  final String rate;
  final String price;
  final SaveCaptain saveCaptain;

  @override
  Widget build(BuildContext context) {
    return _buildDriverDetails(context);
  }

  Widget _buildDriverDetails(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25.r,
        backgroundImage: NetworkImage(
          saveCaptain.picture ??
              'https://r2-us-west.photoai.com/1725044540-0740bf41f0465a6d0ef030a85d1f270a-1.png',
        ),
      ),
      title: AutoSizeText(
        saveCaptain.name ?? 'name',
        style: AppTextStyles.style18BlackW500,
        maxLines: 1,
      ),
      subtitle: Row(
        children: [
          const Icon(Icons.star, size: 16, color: AppColors.amberColor),
          AutoSizeText(
            rate,
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
          style: AppTextStyles.style14BlackW500,
        ),
        AutoSizeText(
          '$price ${AppLocalizations.of(context)!.iqd}',
          style: AppTextStyles.style14DarkgrayW500,
        ),
      ],
    );
  }
}
