import 'package:geocoding/geocoding.dart';

Future<String> getAddressFromLatLng(double latitude, double longitude) async {
  try {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);

    if (placemarks.isNotEmpty) {
      Placemark place = placemarks[0];

      return 'Address: ${place.street ?? 'No street info'}, '
          '${place.locality ?? 'No locality info'}, '
          '${place.country ?? 'No country info'}';
    } else {
      return 'Place not Found';
    }
  } catch (e) {
    return 'Error occurred: $e';
  }
}
