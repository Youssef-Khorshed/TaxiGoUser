import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocode/geocode.dart';
import 'package:shimmer/shimmer.dart';
import 'package:taxi_go_user_version/Core/Utils/Assets/icons/app_icons.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_user_version/Features/Saved/data/saved_data_model.dart';
import 'package:taxi_go_user_version/Features/Saved/tripSaved_widget/saved_trip_details_map.dart';

class CustomSavedBuildAddressRow extends StatelessWidget {
  const CustomSavedBuildAddressRow({
    super.key,
    required this.rideRequest,
    required this.savedRide,
  });

  final SavedRideRequest rideRequest;
  final SavedRide savedRide;

  @override
  Widget build(BuildContext context) {
    if (rideRequest.latFrom == null ||
        rideRequest.lngFrom == null ||
        rideRequest.latTo == null ||
        rideRequest.lngTo == null) {
      return const Center(child: Text("Invalid location data"));
    }

    return FutureBuilder<Map<String, String>>(
      future: _getFormattedAddresses(
        fromLatitude: double.parse(savedRide.rideRequest!.latFrom!),
        fromLongitude: double.parse(savedRide.rideRequest!.lngFrom!),
        toLatitude: double.parse(savedRide.rideRequest!.latTo!),
        toLongitude: double.parse(savedRide.rideRequest!.lngTo!),
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
                  child: const SavedTripDetailsMap(
                    address: " ",
                    location: " ",
                    icon: AppIcons.iconsMapRed,
                  ),
                ),
                verticalSpace(10.h),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: const SavedTripDetailsMap(
                    address: " ",
                    location: " ",
                    icon: AppIcons.iconsMapBlue,
                  ),
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
              SavedTripDetailsMap(
                address: fromAddress,
                location: fromCity,
                icon: AppIcons.iconsMapRed,
              ),
              SavedTripDetailsMap(
                address: toAddress,
                location: toCity,
                icon: AppIcons.iconsMapBlue,
              ),
            ],
          ),
          trailing: Text(
            '${savedRide.distance} ${AppLocalizations.of(context)!.km}',
            style: TextStyle(fontSize: 15.sp),
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
