import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Error/exception.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/api_constant.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/apiservices.dart';
import 'package:taxi_go_user_version/Features/Saved/data/repo/saved_repo.dart';
import 'package:taxi_go_user_version/Features/Saved/data/save_trip_model.dart';
import 'package:taxi_go_user_version/Features/Saved/data/saved_data_model.dart';
import 'package:taxi_go_user_version/Features/Saved/data/un_save_model.dart';

class SavedRepoImpl extends SavedRepo {
  final ApiService apiService;
  SavedRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, SavedDataModel>> getAllSavedData(
      BuildContext context) async {
    var response = await apiService.getRequest(
      Constants.baseUrl + Constants.savedEndPoint,
      context: context,
    );

    try {
      SavedDataModel historyDataModel = SavedDataModel.fromJson(response);

      return Right(historyDataModel);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, SaveTripModel>> saveTrip(
      BuildContext context, int rideId) async {
    var response = await apiService.postRequest(
        Constants.baseUrl + Constants.saveTripEndPoint,
        context: context,
        body: {
          "ride_id": rideId,
        });
    try {
      SaveTripModel saveTripModel = SaveTripModel.fromJson(response);

      return Right(saveTripModel);
    } on NoInternetException {
      return Left(InternetConnectionFailure(message: 'No internet Connection'));
    } on ServerException catch (e) {
      return Left(InternetConnectionFailure(message: e.message.toString()));
    }
  }

  @override
  Future<Either<Failure, UnSaveModel>> unSaveTrip(
      BuildContext context, int tripId) async {
    var response = await apiService.deleteRequest(
      '${Constants.baseUrl}${Constants.unSaveTripEndPoint}$tripId',
      context: context,
    );
    try {
      UnSaveModel unSaveModel = UnSaveModel.fromJson(response);
      log('saveTripModel');

      return Right(unSaveModel);
    } on NoInternetException {
      return Left(InternetConnectionFailure(message: 'No internet Connection'));
    } on ServerException catch (e) {
      return Left(InternetConnectionFailure(message: e.message.toString()));
    }
  }
}
