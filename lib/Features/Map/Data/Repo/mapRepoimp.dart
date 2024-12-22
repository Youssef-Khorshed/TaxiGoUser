import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Error/exception.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/api_constant.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/apiservices.dart';
import 'package:taxi_go_user_version/Features/Map/Data/Repo/mapRepo.dart';
import 'package:taxi_go_user_version/Features/Map/Data/model/calculateAverageModel/calculateAverage.dart';
import 'package:taxi_go_user_version/Features/Map/Data/model/get_active_ride/get_active_ride.dart';
import 'package:taxi_go_user_version/Features/Map/Data/model/placesModel/directions/directions.dart';
import 'package:taxi_go_user_version/Features/Map/Data/model/placesModel/geocode_adress/geocode_adress.dart';
import 'package:taxi_go_user_version/Features/Map/Data/model/placesModel/place_details/place_details.dart';
import 'package:taxi_go_user_version/Features/Map/Data/model/placesModel/place_search/search.dart';
import 'package:taxi_go_user_version/Features/Map/Data/model/rideRequestModel/cancel/cancelRideRequest.dart';
import 'package:taxi_go_user_version/Features/Map/Data/model/rideRequestModel/ride/rideRequest.dart';

class Maprepoimp extends MapRepo {
  ApiService apiService;
  Maprepoimp({required this.apiService});
  @override
  Future<Either<Failure, SearchPlace>> fetchSuggestions(
      {required String searchQuery,
      required String sessionToken,
      required BuildContext context}) async {
    try {
      final res = await apiService.getRequest(
          Constants.searchplace(
              searchQuery: searchQuery, sessionToken: sessionToken),
          context: context);

      return Right(SearchPlace.fromJson(res));
    } on NoInternetException {
      return Left(InternetConnectionFailure(message: 'No internet Connection'));
    } on ServerException catch (e) {
      return Left(InternetConnectionFailure(message: e.message.toString()));
    }
  }

  @override
  Future<Either<Failure, PlaceDetails>> getPlaceLocation({
    required String placeId,
    required String sessionToken,
    required BuildContext context,
  }) async {
    try {
      final res = await apiService.getRequest(
          context: context,
          Constants.placeDetails(placeId: placeId, sessionToken: sessionToken));
      return Right(PlaceDetails.fromJson(res));
    } on NoInternetException {
      return Left(InternetConnectionFailure(message: 'No internet Connection'));
    } on ServerException catch (e) {
      return Left(InternetConnectionFailure(message: e.message.toString()));
    }
  }

  @override
  Future<Either<Failure, CalculateAverage>> calculatePrice(
      {required BuildContext context,
      required int time,
      required String distance,
      required int triptype,
      required LatLng origin,
      required LatLng destination}) async {
    try {
      final res = await apiService.getRequest(
          context: context,
          Constants.calculatePrice,
          queryParameters: Constants.calculatePriceBody(
            latFrom: origin.latitude.toString(),
            lngFrom: origin.longitude.toString(),
            latTo: destination.latitude.toString(),
            lngTo: destination.longitude.toString(),
            tripType: triptype,
            durationMinutes: time,
          ));
      return Right(CalculateAverage.fromJson(res));
    } on NoInternetException {
      return Left(InternetConnectionFailure(message: 'No internet Connection'));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message.toString()));
    } on UnExpectedException catch (e) {
      return Left(UnExpectedFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, CancelRideRequest>> canelRideRequest({
    required BuildContext context,
  }) async {
    try {
      final res = await apiService.postRequest(
          context: context, Constants.cancelRideRequest);
      return Right(CancelRideRequest.fromJson(res));
    } on NoInternetException {
      return Left(InternetConnectionFailure(message: 'No internet Connection'));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> checkPromocode(
      {required BuildContext context, required String code}) async {
    try {
      await apiService.getRequest(
          context: context,
          Constants.checkPromocode,
          queryParameters: Constants.checkPromocodeBody(code: code));
      return const Right(unit);
    } on NoInternetException {
      return Left(InternetConnectionFailure(message: 'No internet Connection'));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message.toString()));
    }
  }

  @override
  Future<Either<Failure, RideRequest>> rideRequest({
    required BuildContext context,
    required String addressFrom,
    required String latFrom,
    required String lngFrom,
    required String addressTo,
    required String latTo,
    required String lngTo,
    required int tripType,
    required String paymentMethod,
    String? promocode,
  }) async {
    try {
      final res = await apiService.postRequest(
          context: context,
          Constants.rideRequest,
          body: Constants.rideRequestBody(
              addressFrom: addressFrom,
              latFrom: latFrom,
              lngFrom: lngFrom,
              addressTo: addressTo,
              latTo: latTo,
              lngTo: lngTo,
              tripType: tripType,
              paymentMethod: paymentMethod));
      return Right(RideRequest.fromJson(res));
    } on NoInternetException {
      return Left(InternetConnectionFailure(message: 'No internet Connection'));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message.toString()));
    }
  }

  @override
  Future<Either<Failure, Directions>> getDrirection(
      {required LatLng origin,
      required LatLng destination,
      required String sessionToken,
      required BuildContext context}) async {
    try {
      final res = await apiService.getRequest(
          context: context,
          Constants.directions(
              origin: origin,
              destination: destination,
              sessionToken: sessionToken));
      return Right(Directions.fromJson(res));
    } on NoInternetException {
      return Left(InternetConnectionFailure(message: 'No internet Connection'));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message.toString()));
    }
  }

  @override
  Future<Either<Failure, GeocodeAdress>> getPlaceAddress(
      {required LatLng placeLatLng,
      required String sessionToken,
      required BuildContext context}) async {
    try {
      final res = await apiService.getRequest(
          context: context,
          Constants.geolcatorAddress(
              sessionToken: sessionToken, placeLatLng: placeLatLng));
      return Right(GeocodeAdress.fromJson(res));
    } on NoInternetException {
      return Left(InternetConnectionFailure(message: 'No internet Connection'));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message.toString()));
    }
  }

  @override
  Future<Either<Failure, GetActiveRide>> getActiveRide(
      {required BuildContext context}) async {
    try {
      final res = await apiService.getRequest(
          context: context, Constants.getactiveRide);
      return Right(GetActiveRide.fromJson(res));
    } on NoInternetException {
      return Left(InternetConnectionFailure(message: 'No internet Connection'));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message.toString()));
    }
  }
}
