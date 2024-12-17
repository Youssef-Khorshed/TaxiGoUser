class Constants {
  static const String baseUrl = 'https://go-taxi.codecraft1.com/api';
  static const String userToken =
      '31|Kmu10EvtFiRiyrsufe3dy2z7q5ECODM9pqhECxtP7f2800da';
  static const String mapToken = 'AIzaSyCI1Xh53omwfYyDPXsovvHwjMgyvamPtow';

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

  static const String calculatePrice = '/customer/calculate-price';
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

  static const String rideRequest = '/customer/ride-requests';

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
        "lat_from": addressFrom,
        "lng_from": latFrom,
        "address_to": addressTo,
        "lat_to": latTo,
        "lng_to": lngTo,
        "trip_type": tripType, // 1 ,2 ,3
        "payment_method": paymentMethod, // wallet ,
        "promocode": promocode
      };

  static const String cancelRideRequest = '/customer/ride-requests/cancel';
  static const String checkPromocode = '/customer/promocode/check';
  static Map<String, dynamic> checkPromocodeBody({required String code}) => {
        "code": code //"SAVE10"//"SUMMER2024"
      };
  static const String getactiveRide = '/customer/rides/active';
  static const String cancelRide = '/customer/rides/cancel';
  static String rateCaptin({required String rate}) =>
      '/customer/rides/rate?rate=$rate';
  static const kModelFont = 'Medel';
}
