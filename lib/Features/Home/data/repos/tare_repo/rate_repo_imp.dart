import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/api_constant.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/apiservices.dart';
import 'package:taxi_go_user_version/Features/Home/data/models/rete_model/rate_model.dart';
import 'package:taxi_go_user_version/Features/Home/data/repos/tare_repo/rate_repo.dart';

class RateRepoImp implements RateRepo {
  final ApiService apiService;

  RateRepoImp({required this.apiService});

  @override
  Future<Either<Failure, RateModel>> rateTrip(
      BuildContext context, String comment, double rate) async {
    final response = await apiService.postRequest(
      Constants.rateTripe,
      context: context,
      body: {"rate": rate, "comment": comment},
    );
    return response.fold(((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }), (ifRight) {
      if (ifRight.data["status"] == false) {
        return Left(ServerFailure(message: ifRight.data["message"]));
      } else {
        return Right(
          RateModel.fromJson(ifRight.data),
        );
      }
    });
  }
}
