// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_user_version/Features/Map/Data/model/calculateAverageModel/calculateAverage.dart';
import 'package:taxi_go_user_version/Features/Map/Data/model/get_active_ride/get_active_ride.dart';
import 'package:taxi_go_user_version/Features/Map/Data/model/placesModel/directions/directions.dart';
import 'package:taxi_go_user_version/Features/Map/Data/model/placesModel/geocode_adress/geocode_adress.dart';
import 'package:taxi_go_user_version/Features/Map/Data/model/placesModel/place_details/place_details.dart';
import 'package:dartz/dartz.dart';
import 'package:taxi_go_user_version/Features/Map/Data/model/placesModel/place_search/search.dart';
import 'package:taxi_go_user_version/Features/Map/Data/model/rideRequestModel/cancel/cancelRideRequest.dart';
import 'package:taxi_go_user_version/Features/Map/Data/model/rideRequestModel/ride/rideRequest.dart';

abstract class MapRepo {
  Future<Either<Failure, SearchPlace>> fetchSuggestions({
    required String searchQuery,
    required String sessionToken,
    required BuildContext context,
  });
  Future<Either<Failure, PlaceDetails>> getPlaceLocation({
    required String placeId,
    required String sessionToken,
    required BuildContext context,
  });
  Future<Either<Failure, CalculateAverage>> calculatePrice(
      {required BuildContext context,
      required int time,
      required String distance,
      required int triptype,
      required LatLng origin,
      required LatLng destination});
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
  });
  Future<Either<Failure, Unit>> checkPromocode({
    required String code,
    required BuildContext context,
  });
  Future<Either<Failure, CancelRideRequest>> canelRideRequest({
    required BuildContext context,
  });
  Future<Either<Failure, GeocodeAdress>> getPlaceAddress({
    required LatLng placeLatLng,
    required String sessionToken,
    required BuildContext context,
  });
  Future<Either<Failure, Directions>> getDrirection({
    required LatLng origin,
    required LatLng destination,
    required String sessionToken,
    required BuildContext context,
  });

  Future<Either<Failure, GetActiveRide>> getActiveRide({
    required BuildContext context,
  });
}
