import 'package:taxi_go_user_version/Features/Map/Data/model/placesModel/geocode_adress/address_component.dart';

class MapStringMaipulation {
  static String concatenateLongNames(
      List<AddressComponent>? addressComponents) {
    if (addressComponents == null) return "";
    return addressComponents.map((component) => component.longName).join(" ");
  }

  static String concatenateShortNames(
      List<AddressComponent>? addressComponents) {
    if (addressComponents == null) return "";
    return addressComponents.map((component) => component.shortName).join(" ");
  }

  static List<String> formatAddress({required String address}) {
    List<String> parts = address.toString().split(',');
    String streetNumber = '';
    String streetAddress = '';
    String city = '';
    String region = '';
    String postalCode = '';
    String countryName = '';

    for (var part in parts) {
      if (part.contains('streetNumber=')) {
        streetNumber = part.split('=')[1].trim();
      } else if (part.contains('streetAddress=')) {
        streetAddress = part.split('=')[1].trim();
      } else if (part.contains('city=')) {
        city = part.split('=')[1].trim();
      } else if (part.contains('region=')) {
        region = part.split('=')[1].trim();
      } else if (part.contains('postal=')) {
        postalCode = part.split('=')[1].trim();
      } else if (part.contains('countryName=')) {
        countryName = part.split('=')[1].trim();
      }
    }

    return [
      streetNumber,
      streetAddress,
      city,
      region,
      postalCode,
      countryName,
    ];
  }
}
