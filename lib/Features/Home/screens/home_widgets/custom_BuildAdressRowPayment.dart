// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocode/geocode.dart';
import 'package:shimmer/shimmer.dart';

import 'package:taxi_go_user_version/Core/Utils/Assets/icons/app_icons.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/trip_details.dart';

class BuildAddressRowUpdated extends StatelessWidget {
  const BuildAddressRowUpdated({
    super.key,
    required this.lateFrom,
    required this.langFrom,
    required this.lateTo,
    required this.langTo,
    required this.distance,
  });

  final String lateFrom;
  final String langFrom;
  final String lateTo;
  final String langTo;
  final double distance;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, String>>(
      future: _getFormattedAddresses(
        fromLatitude: double.parse(lateFrom),
        fromLongitude: double.parse(langFrom),
        toLatitude: double.parse(lateTo),
        toLongitude: double.parse(langTo),
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: simmerWidget(context),
                ),
                const SizedBox(height: 10),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: simmerWidget(context),
                ),
              ],
            ),
          );
        }

        if (snapshot.hasError || !snapshot.hasData) {
          return const ListTile(
            title: Text("حدث خطأ أثناء جلب البيانات"),
          );
        }

        final fromAddress = snapshot.data!['fromAddress']!;
        final fromCity = snapshot.data!['fromCity']!;
        final toAddress = snapshot.data!['toAddress']!;
        final toCity = snapshot.data!['toCity']!;

        return ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TripDetailsMap(
                address: fromAddress,
                location: fromCity,
                icon: AppIcons.iconsMapRed,
              ),
              TripDetailsMap(
                address: toAddress,
                location: toCity,
                icon: AppIcons.mapBlueIcon,
              ),
            ],
          ),
          trailing: Text(
            "$distance ${AppLocalizations.of(context)!.km}",
            style: AppTextStyles.style12DarkgrayW400,
          ),
        );
      },
    );
  }

  Future<Map<String, String>> _getFormattedAddresses({
    required double fromLatitude,
    required double fromLongitude,
    required double toLatitude,
    required double toLongitude,
  }) async {
    try {
      final fromAddress = await _getAddress(fromLatitude, fromLongitude);
      final toAddress = await _getAddress(toLatitude, toLongitude);

      return {
        'fromAddress': fromAddress['address']!,
        'fromCity': fromAddress['city']!,
        'toAddress': toAddress['address']!,
        'toCity': toAddress['city']!,
      };
    } catch (e) {
      throw Exception("فشل في جلب العناوين: $e");
    }
  }

  Future<Map<String, String>> _getAddress(
      double latitude, double longitude) async {
    final address = await GeoCode()
        .reverseGeocoding(latitude: latitude, longitude: longitude);

    if (address == null) {
      throw Exception("عنوان غير موجود");
    }
    String getCity(String city) {
      if (city.isEmpty) return '';

      List<String> parts = city.split(' ');
      if (parts.length > 2) {
        return '${parts[0]} ${parts[1]}';
      }

      return city;
    }

    return {
      'address': address.streetAddress ?? '',
      'city': getCity(address.city ?? ''),
    };
  }
}

Widget simmerWidget(context) {
  return Column(
    children: [
      ListTile(
        title: Container(
          height: 15.h,
          width: 20.w,
          decoration: BoxDecoration(
              color: AppColors.grayColor,
              borderRadius: BorderRadius.circular(12.r)),
        ),
        subtitle: Container(
          height: 15.h,
          width: 50.w,
          decoration: BoxDecoration(
              color: AppColors.grayColor,
              borderRadius: BorderRadius.circular(12.r)),
        ),
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
              width: MediaQuery.of(context).size.width * .05,
              child: SvgPicture.asset(
                AppIcons.mapBlueIcon,
              ),
            ),
          ],
        ),
      ),
      horizontalSpace(5),
    ],
  );
}
