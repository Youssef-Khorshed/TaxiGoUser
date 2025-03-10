import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Assets/icons/app_icons.dart';
import 'package:taxi_go_user_version/Core/Utils/Assets/images/app_images.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Features/History/history_widgets/Core/trip_details_map.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_parseAddress.dart';

// ignore: must_be_immutable
class BuildAddressRow extends StatelessWidget {
  String fromAddress;
  String fromLoccation;
  String toAddress;
  String toLocation;
  String? distance;
  String? time;
  BuildAddressRow({
    super.key,
    required this.fromAddress,
    required this.fromLoccation,
    required this.toAddress,
    required this.toLocation,
    this.distance,
    this.time,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TripDetailsMap(
              address: fromAddress,
              location: parseAddress(fromAddress)['street_number'] ?? '',
              icon: AppIcons.iconsMapRed),
          TripDetailsMap(
            address: toAddress,
            location: parseAddress(toAddress)['street_number'] ?? '',
            icon: AppIcons.iconsMapBlue,
          ),
          distance == null
              ? const SizedBox()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImages.timeImage,
                      width: 15,
                      height: 15,
                    ),
                    horizontalSpace(5.w),
                    distance == null
                        ? const SizedBox()
                        : Text(
                            distance!.split('km')[0],
                            style: AppTextStyles.style12BlackW700,
                          ),
                    horizontalSpace(5.w),
                    Text(
                      AppLocalizations.of(context)!.km,
                      style: AppTextStyles.style10DarkgrayW700,
                    ),
                    horizontalSpace(5.w),
                    time == null
                        ? const SizedBox()
                        : Text(
                            ' ${time!.split('mins')[0]}',
                            style: AppTextStyles.style12BlackW700,
                          ),
                    horizontalSpace(5.w),
                    Text(
                      AppLocalizations.of(context)!.min,
                      style: AppTextStyles.style10DarkgrayW700,
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
