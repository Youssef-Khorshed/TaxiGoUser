import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Assets/images/app_images.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_user_version/Features/Home/data/models/ride_complete_model/ride_complete_details_model.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_buildrowdetail_hiring.dart';

class PaymentsDetails extends StatelessWidget {
  const PaymentsDetails({
    super.key,
    required this.size,
    required this.rideDetails,
  });
  final RideCompleteDetailsModel rideDetails;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          AppLocalizations.of(context)!.payment_details,
          style: AppTextStyles.style16BlackW600,
        ),
        verticalSpace(size.height * 0.01),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.payment_method,
                  style: AppTextStyles.style14DarkgrayW500,
                ),
                Spacer(),
                Row(children: [
                  Text(
                    rideDetails.paymentMethod ?? "",
                    style: AppTextStyles.style14DarkgrayW500,
                  ),
                  horizontalSpace(5.w),
                  Image.asset(AppImages.cash, height: size.height * 0.02),
                ]),
              ],
            ),
            Buildrowdetail(
                label: AppLocalizations.of(context)!.distance,
                value:
                    '${rideDetails.ride!.distance} ${AppLocalizations.of(context)!.km} '),
            Buildrowdetail(
                label: AppLocalizations.of(context)!.time,
                value:
                    '${rideDetails.ride!.time?.round()} ${AppLocalizations.of(context)!.min} '),
            Buildrowdetail(
                label: AppLocalizations.of(context)!.promo_code,
                value:
                    '${rideDetails.promocode ?? AppLocalizations.of(context)!.noPromoCode}  '),
            Buildrowdetail(
              label: AppLocalizations.of(context)!.total,
              value:
                  '${rideDetails.ride!.paid} ${AppLocalizations.of(context)!.currency} ',
              isBold: true,
            ),
          ],
        ),
      ],
    );
  }
}
