import 'package:google_maps_flutter/google_maps_flutter.dart';

class Constants {
  static const String baseUrl = 'https://go-taxi.codecraft1.com/api';
  static const String userToken =
      '130|pTBzqKJZfluwlnwPXVjOhyL4lQZVpdpg9a0R7lk5317c66ec';
  static const String rateTripe =
      'https://go-taxi.codecraft1.com/api/customer/rides/rate';
  static const String cancelRideAfter =
      'https://go-taxi.codecraft1.com/api/customer/rides/cancel';
  static const String completeRide =
      'https://go-taxi.codecraft1.com/api/customer/rides/get-last';

  static const String mapToken = 'AIzaSyCmrk6YbjdCAlwichSDNyyfxlA7zwXhVwc';

  /// Routes
  static String searchplace(
          {required String searchQuery,
          required String sessionToken,
          String language = 'en'}) =>
      'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=-$searchQuery&sessiontoken=$sessionToken&language=$language&key=$mapToken';

  static String placeDetails({
    required String placeId,
    required String sessionToken,
  }) =>
      'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&fields=geometry&sessiontoken=$sessionToken&key=$mapToken';

  static String geolcatorAddress({
    required LatLng placeLatLng,
    required String sessionToken,
  }) =>
      'https://maps.googleapis.com/maps/api/geocode/json?latlng=${placeLatLng.latitude},${placeLatLng.longitude}&key=$mapToken&sessiontoken=$sessionToken';

  static String directions({
    required LatLng origin,
    required LatLng destination,
    required String sessionToken,
  }) =>
      'https://maps.googleapis.com/maps/api/directions/json?origin=${origin.latitude},${origin.longitude}&destination=${destination.latitude},${destination.longitude}&key=$mapToken&sessiontoken=$sessionToken';

  static const String calculatePrice = '$baseUrl/customer/calculate-price';
  static Map<String, dynamic> calculatePriceBody({
    required String latFrom,
    required String lngFrom,
    required String latTo,
    required String lngTo,
    required int tripType,
    required int durationMinutes,
  }) =>
      {
        "lat_from": latFrom,
        "lng_from": lngFrom,
        "lat_to": latTo,
        "lng_to": lngTo,
        "trip_type": tripType,
        "duration_minutes": durationMinutes
      };

  static const String rideRequest = '$baseUrl/customer/ride-requests';

  static Map<String, dynamic> rideRequestBody({
    required String addressFrom,
    required String latFrom,
    required String lngFrom,
    required String addressTo,
    required String latTo,
    required String lngTo,
    required int tripType,
    required String paymentMethod,
    String? promocode,
  }) =>
      {
        "address_from": addressFrom,
        "lat_from": latFrom,
        "lng_from": lngFrom,
        "address_to": addressTo,
        "lat_to": latTo,
        "lng_to": lngTo,
        "trip_type": tripType, // 1 ,2 ,3
        "payment_method": paymentMethod, // wallet ,
        "promocode": promocode
      };

  static const String cancelRideRequest =
      '$baseUrl/customer/ride-requests/cancel';
  static const String checkPromocode = '$baseUrl/customer/promocode/check';
  static Map<String, dynamic> checkPromocodeBody({required String code}) => {
        "code": code //"SAVE10"//"SUMMER2024"
      };
  static const String getactiveRide = '$baseUrl/customer/rides/active';
  static const String cancelRide = '/customer/rides/cancel';
  static String rateCaptin({required String rate}) =>
      '/customer/rides/rate?rate=$rate';
  static const kModelFont = 'Medel';
  static const rooms = 'https://go-taxi.codecraft1.com/api/customer/rides/get-messages';
  static const sendchat = 'https://go-taxi.codecraft1.com/api/customer/rides/send-message';
}
