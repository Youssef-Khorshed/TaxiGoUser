import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Error/exception.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/api_constant.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/apiservices.dart';
import 'package:taxi_go_user_version/Features/Home/data/models/rete_model/rate_model.dart';
import 'package:taxi_go_user_version/Features/Home/data/repos/cancle_repo/cancel_repo.dart';

class CancelRepoImp implements CancelRepo {
  final ApiService apiService;

  CancelRepoImp({required this.apiService});

  @override
  Future<Either<Failure, RateModel>> cancel(
      BuildContext context, String reason) async {
    try {
      final ratStatus = await apiService.postRequest(
        Constants.cancelRideAfter,
        context: context,
        body: {"reason": reason},
      );

      return Right(
        RateModel.fromJson(ratStatus),
      );
    } on NoInternetException {
      return Left(InternetConnectionFailure(message: 'No internet Connection'));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message.toString()));
    }
  }
}
