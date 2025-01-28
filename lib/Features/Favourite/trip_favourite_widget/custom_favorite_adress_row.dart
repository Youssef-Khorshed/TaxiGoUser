import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocode/geocode.dart';
import 'package:shimmer/shimmer.dart';
import 'package:taxi_go_user_version/Core/Utils/Assets/icons/app_icons.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Features/Favourite/data/favorite_data_model.dart';
import 'package:taxi_go_user_version/Features/Favourite/trip_favourite_widget/favorite_trip_details_map.dart';

class CustomFavBuildAddressRow extends StatelessWidget {
  const CustomFavBuildAddressRow({
    super.key,
    required this.rideDetails,
    required this.distance,
  });
  final RideRequestData rideDetails;
  final dynamic distance;

  @override
  Widget build(BuildContext context) {
    if (rideDetails.latFrom == null ||
        rideDetails.lngFrom == null ||
        rideDetails.latTo == null ||
        rideDetails.lngTo == null) {
      return const Center(child: Text("Invalid location data"));
    }

    return FutureBuilder<Map<String, String>>(
      future: _getFormattedAddresses(
        fromLatitude: double.parse(rideDetails.latFrom!),
        fromLongitude: double.parse(rideDetails.lngFrom!),
        toLatitude: double.parse(rideDetails.latTo!),
        toLongitude: double.parse(rideDetails.lngTo!),
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
                verticalSpace(10.h),
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

        return Padding(
          padding: EdgeInsets.all(15.0.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FavoriteTripDetailsMap(
                address: fromAddress,
                location: fromCity,
                icon: AppIcons.iconsMapRed,
              ),
              Text(
                distance != 0
                    ? '${distance.toStringAsFixed(1)} ${AppLocalizations.of(context)!.km}'
                    : "",
                style: TextStyle(fontSize: 15.sp),
              ),
              FavoriteTripDetailsMap(
                address: toAddress,
                location: toCity,
                icon: AppIcons.iconsMapBlue,
              ),
            ],
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
              color: AppColors.kgrey,
              borderRadius: BorderRadius.circular(100.r)),
        ),
        subtitle: Container(
          height: 15.h,
          width: 50.w,
          decoration: BoxDecoration(
              color: AppColors.kgrey,
              borderRadius: BorderRadius.circular(100.r)),
        ),
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
              width: MediaQuery.of(context).size.width * .05,
              child: SvgPicture.asset(
                AppIcons.iconsMapBlue,
              ),
            ),
          ],
        ),
      ),
      horizontalSpace(5.w),
    ],
  );
}
