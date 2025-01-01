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
import 'package:taxi_go_user_version/Features/Map/Data/model/get_last_ride/get_last_ride.dart';
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
    final response = await apiService.getRequest(
        Constants.searchplace(
            searchQuery: searchQuery, sessionToken: sessionToken),
        context: context);

    return response.fold(((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }), (ifRight) {
      if (ifRight.data["status"] == false) {
        return Left(ServerFailure(message: ifRight.data["message"]));
      } else {
        return Right(SearchPlace.fromJson(ifRight.data));
      }
    });
  }

  @override
  Future<Either<Failure, PlaceDetails>> getPlaceLocation({
    required String placeId,
    required String sessionToken,
    required BuildContext context,
  }) async {
    final response = await apiService.getRequest(
        context: context,
        Constants.placeDetails(placeId: placeId, sessionToken: sessionToken));

    return response.fold(((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }), (ifRight) {
      if (ifRight.data["status"] == false) {
        return Left(ServerFailure(message: ifRight.data["message"]));
      } else {
        return Right(PlaceDetails.fromJson(ifRight.data));
      }
    });
  }

  @override
  Future<Either<Failure, CalculateAverage>> calculatePrice(
      {required BuildContext context,
      required int time,
      required String distance,
      required int triptype,
      required LatLng origin,
      required LatLng destination}) async {
    final response = await apiService.getRequest(
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

    return response.fold(((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }), (ifRight) {
      if (ifRight.data["status"] == false) {
        return Left(ServerFailure(message: ifRight.data["message"]));
      } else {
        return Right(CalculateAverage.fromJson(ifRight.data));
      }
    });
  }

  @override
  Future<Either<Failure, CancelRideRequest>> canelRideRequest({
    required BuildContext context,
  }) async {
    final response = await apiService.postRequest(
        context: context, Constants.cancelRideRequest);
    return response.fold(((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }), (ifRight) {
      if (ifRight.data["status"] == false) {
        return Left(ServerFailure(message: ifRight.data["message"]));
      } else {
        return Right(CancelRideRequest.fromJson(ifRight.data));
      }
    });
  }

  @override
  Future<Either<Failure, Unit>> checkPromocode(
      {required BuildContext context, required String code}) async {
    final response = await apiService.getRequest(
        context: context,
        Constants.checkPromocode,
        queryParameters: Constants.checkPromocodeBody(code: code));
    return response.fold(((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }), (ifRight) {
      if (ifRight.data["status"] == false) {
        return Left(ServerFailure(message: ifRight.data["message"]));
      } else {
        return const Right(unit);
      }
    });
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
    final response = await apiService.postRequest(
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
    return response.fold(((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }), (ifRight) {
      if (ifRight.data["status"] == false) {
        return Left(ServerFailure(message: ifRight.data["message"]));
      } else {
        return Right(RideRequest.fromJson(ifRight.data));
      }
    });
  }

  @override
  Future<Either<Failure, Directions>> getDrirection(
      {required LatLng origin,
      required LatLng destination,
      required String sessionToken,
      required BuildContext context}) async {
    final response = await apiService.getRequest(
        context: context,
        Constants.directions(
            origin: origin,
            destination: destination,
            sessionToken: sessionToken));
    return response.fold(((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }), (ifRight) {
      if (ifRight.data["status"] == "ZERO_RESULTS") {
        return Left(ServerFailure(message: ifRight.data["message"]));
      } else if (ifRight.data["status"] == "ZERO_RESULTS") {
        return Left(ServerFailure(message: "No Routes Found"));
      } else {
        return Right(Directions.fromJson(ifRight.data));
      }
    });
  }

  @override
  Future<Either<Failure, GeocodeAdress>> getPlaceAddress(
      {required LatLng placeLatLng,
      required String sessionToken,
      required BuildContext context}) async {
    final response = await apiService.getRequest(
        context: context,
        Constants.geolcatorAddress(
            sessionToken: sessionToken, placeLatLng: placeLatLng));
    return response.fold(((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }), (ifRight) {
      if (ifRight.data["status"] == false) {
        return Left(ServerFailure(message: ifRight.data["message"]));
      } else {
        return Right(GeocodeAdress.fromJson(ifRight.data));
      }
    });
  }

  @override
  Future<Either<Failure, GetActiveRide>> getActiveRide(
      {required BuildContext context}) async {
    final response =
        await apiService.getRequest(context: context, Constants.getactiveRide);
    return response.fold(((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }), (ifRight) {
      if (ifRight.data["status"] == false) {
        return Left(ServerFailure(message: ifRight.data["message"]));
      } else {
        return Right(GetActiveRide.fromJson(ifRight.data));
      }
    });
  }

  @override
  Future<Either<Failure, GetLastRide>> getLastRide(
      {required BuildContext context}) async {
    final response =
        await apiService.getRequest(context: context, Constants.getLastRide);
    return response.fold(((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }), (ifRight) {
      if (ifRight.data["status"] == false) {
        return Left(ServerFailure(message: ifRight.data["message"]));
      } else {
        return Right(GetLastRide.fromJson(ifRight.data));
      }
    });
  }
}
