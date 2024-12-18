import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:geocoding/geocoding.dart';
import 'package:taxi_go_user_version/Core/Utils/Assets/icons/app_icons.dart';
import 'package:taxi_go_user_version/Features/Home/data/models/ride_complete_model/ride_complete_details_model.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/trip_details.dart';

class LocationDetails extends StatelessWidget {
  const LocationDetails({
    super.key,
    required this.rideDetails,
  });
  final RideCompleteDetailsModel rideDetails;

  Future<String> getAddressFromLatLng(
      double latitude, double longitude, String addressType) async {
    try {
      // طباعة الإحداثيات للتأكد من صحتها
      print("Getting address for lat: $latitude, long: $longitude");

      // الحصول على قائمة العناوين بناءً على الإحداثيات
      List<Placemark> placeMarks =
          await placemarkFromCoordinates(latitude, longitude);

      // طباعة العناوين التي تم الحصول عليها
      print("Placemark: ${placeMarks}");

      // استخراج أول عنوان
      Placemark place = placeMarks.isNotEmpty ? placeMarks[0] : Placemark();
      String places =
          "${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
      print("********************************places:= $places");

      // التحقق من نوع العنوان المطلوب
      switch (addressType) {
        case AddressConstants.street:
          return "${place.street}";
        case AddressConstants.country:
          return "${place.country}";
        case AddressConstants.locality:
          return "${place.locality}"; // اسم المدينة
        case AddressConstants.administrativeArea:
          return "${place.administrativeArea}";
        case AddressConstants.fullAddress:
          return "${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
        default:
          return "Invalid address type";
      }
    } catch (e) {
      print("Error while fetching address: $e");
      return "Error: $e";
    }
  }

  @override
  Widget build(BuildContext context) {
    // التحقق من وجود الإحداثيات قبل تحويلها
    final double latitudeFrom = rideDetails.latFrom != null
        ? double.tryParse(rideDetails.latFrom!) ?? 0.0
        : 0.0;
    final double longitudeFrom = rideDetails.lngFrom != null
        ? double.tryParse(rideDetails.lngFrom!) ?? 0.0
        : 0.0;
    final double latitudeTo = rideDetails.latTo != null
        ? double.tryParse(rideDetails.latTo!) ?? 0.0
        : 0.0;
    final double longitudeTo = rideDetails.lngTo != null
        ? double.tryParse(rideDetails.lngTo!) ?? 0.0
        : 0.0;

    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // عرض اسم المدينة من "من"
          if (latitudeFrom != 0.0 && longitudeFrom != 0.0)
            FutureBuilder<String>(
              future: getAddressFromLatLng(
                  latitudeFrom, longitudeFrom, AddressConstants.locality),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Text("No city found");
                } else {
                  return TripDetailsMap(
                    address: snapshot.data ?? "No city found",
                    location:
                        snapshot.data ?? "No city found", // عرض اسم المدينة
                    icon: AppIcons.iconsMapRed,
                  );
                }
              },
            )
          else
            Text("Invalid 'From' coordinates"),

          // عرض اسم المدينة من "إلى"
          if (latitudeTo != 0.0 && longitudeTo != 0.0)
            FutureBuilder<String>(
              future: getAddressFromLatLng(
                  latitudeTo, longitudeTo, AddressConstants.locality),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Text("No city found");
                } else {
                  return TripDetailsMap(
                    address: snapshot.data ?? "No city found",
                    location:
                        snapshot.data ?? "No city found", // عرض اسم المدينة
                    icon: AppIcons.iconsMapBlue,
                  );
                }
              },
            )
          else
            Text("Invalid 'To' coordinates"),
        ],
      ),
      trailing: Text(
        "${rideDetails.ride?.distance.toString() ?? ''} ${AppLocalizations.of(context)!.km}",
        style: TextStyle(fontSize: 15),
      ),
    );
  }
}

// تعريف ثابتات العناوين
class AddressConstants {
  static const String fullAddress = "fullAddress";
  static const String street = "street";
  static const String locality = "locality"; // المدينة
  static const String administrativeArea = "administrativeArea";
  static const String country = "country";
}
