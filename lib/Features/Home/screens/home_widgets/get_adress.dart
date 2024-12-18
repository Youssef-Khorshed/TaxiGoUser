import 'package:geocoding/geocoding.dart';

Future<String> getAddressFromLatLng(
    double latitude, double longitude, String addressType) async {
  try {
    // الحصول على قائمة العناوين بناءً على الإحداثيات
    List<Placemark> placeMarks =
        await placemarkFromCoordinates(latitude, longitude);

    // استخراج أول عنوان
    Placemark place = placeMarks[0];

    // التحقق من نوع العنوان المطلوب
    switch (addressType) {
      case AddressConstants.street:
        return "${place.street}";
      case AddressConstants.country:
        return "${place.country}";
      case AddressConstants.locality:
        return "${place.locality}";
      case AddressConstants.administrativeArea:
        return "${place.administrativeArea}";
      case AddressConstants.fullAddress:
        return "${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
      default:
        return "Invalid address type";
    }
  } catch (e) {
    return "Error: $e";
  }
}

// تعريف ثابتات العناوين
class AddressConstants {
  static const String fullAddress = "fullAddress";
  static const String street = "street";
  static const String locality = "locality";
  static const String administrativeArea = "administrativeArea";
  static const String country = "country";
}
