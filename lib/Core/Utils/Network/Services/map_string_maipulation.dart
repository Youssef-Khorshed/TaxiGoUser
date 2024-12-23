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

  static Future<Map<String, String>> parseAddress(String address) {
    List<String> addressParts = address.split(' ');
    Map<String, String> parsedAddress = {};
    if (addressParts.isNotEmpty) {
      parsedAddress['street_number'] = addressParts[0];
      parsedAddress['street_name'] =
          addressParts.sublist(1, addressParts.length - 5).join(' ');
      parsedAddress['city'] = addressParts[addressParts.length - 5];
      parsedAddress['county'] = addressParts[addressParts.length - 4];
      parsedAddress['state'] = addressParts[addressParts.length - 3];
      parsedAddress['country'] = addressParts[addressParts.length - 2];
      parsedAddress['postal_code'] = addressParts[addressParts.length - 1];
    }
    return Future.value(parsedAddress);
  }
}
