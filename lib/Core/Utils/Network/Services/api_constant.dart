import 'package:google_maps_flutter/google_maps_flutter.dart';

class Constants {
  static const String baseUrl = 'https://go-taxi.codecraft1.com/api';
  static const String userToken =
      '280|Pm3dBSJwZ0P0QIlu4gzLU2B18YRk1vIuIUpKCFWE371697c7';
  static const String mapToken = 'AIzaSyB3SWKn_1sA3pDumna7B9no7LAo21qC8OQ';
  static String kToken = "kToken";

  /// Routes
  static String searchplace(
          {required String searchQuery,
          required String sessionToken,
          String language = 'en'}) =>
      'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$searchQuery&sessiontoken=$sessionToken&language=$language&components=country:IQ&key=$mapToken';

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
  static const String cancelRide = '$baseUrl/customer/rides/cancel';
  static String rateCaptin({required String rate}) =>
      '/customer/rides/rate?rate=$rate';
  static const kModelFont = 'Medel';
  static const rooms =
      'https://go-taxi.codecraft1.com/api/customer/rides/get-messages';
  static const sendchat =
      'https://go-taxi.codecraft1.com/api/customer/rides/send-message';

  static const String rateTripe =
      'https://go-taxi.codecraft1.com/api/customer/rides/rate';
  static const String cancelRideAfter =
      'https://go-taxi.codecraft1.com/api/customer/rides/cancel';
  static const String completeRide =
      'https://go-taxi.codecraft1.com/api/customer/rides/get-last';

  static const String walletDeposit = 'deposit';
  static const String walleTransactions = '/transactions';
  static const String walleGetProfileData = 'profile';
  static const String getAllNotification = 'notifications';

  static const String getLastRide = '$baseUrl/customer/rides/get-last';
  static String depositURL({
    required String amount,
  }) =>
      '$baseUrl/$walletDeposit?amount=$amount';

  static String transactionsURL({
    String? transactionType,
    String? paymentMethod,
  }) {
    String url = '$baseUrl$walleTransactions';
    if (transactionType != null && transactionType.isNotEmpty) {
      url += '?transaction_type=$transactionType';
    }
    if (paymentMethod != null && paymentMethod.isNotEmpty) {
      url +=
          '${transactionType != null && transactionType.isNotEmpty ? '&' : '?'}payment_method=$paymentMethod';
    }
    return url;
  }

  static String getProfileURL() => '$baseUrl/$walleGetProfileData';

  static String getAllNotificationURL() => '$baseUrl/$getAllNotification';

  static const String getName = '';
  static const String postName = '';

  static String login = '/login';
  static String register = '/customer/register';
  static String sendVerification = "/ask-verification-code";
  static String verifyAccount = "/verify-email";
  static String forgotPassword = "/forgot-password";
  static String forgotPasswordCheckCode = "/forgot-password-check-code";
  static String setPassword = "/set-password";
  static String cities = '/cities';
  static String districts = "/districts-by-city";
  static String createProfile = "/profile/update";
  static String forgotPasswordSet = "/forgot-password-set";
  static String logout = "/logout";
  static const String savedEndPoint = '/customer/saved';
  static const String saveTripEndPoint = '/customer/saved/store';
  static const String unSaveTripEndPoint = '/customer/saved/delete/';
  static const String profileEndPoint = '/profile';
  static const String historyEndPoint = '/customer/rides/history?filter=';
  static const String addFavTripEndPoint = '/customer/favorites/store';
  static const String favoriteEndPoint = '/customer/favorites';
  static const String removefavoriteEndPoint = '/customer/favorites/delete/';
}
