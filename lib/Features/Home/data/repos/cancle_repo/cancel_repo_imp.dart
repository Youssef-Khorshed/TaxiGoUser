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
    final response = await apiService.postRequest(
      Constants.cancelRideAfter,
      context: context,
      body: {"reason": reason},
    );
    return response.fold(((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }), (ifRight) {
      if (ifRight.data["status"] == false) {
        return Left(ServerFailure(message: ifRight.data["message"]));
      } else {
        return Right(RateModel.fromJson(ifRight.data));
      }
    });
  }
}
