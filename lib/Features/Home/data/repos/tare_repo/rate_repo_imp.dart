import 'package:dartz/dartz.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Error/exception.dart';
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
    try {
      final ratStatus = await apiService.postRequest(
        Constants.rateTripe,
        context: context,
        body: {"rate": rate, "comment": comment},
      );

      return Right(
        RateModel.fromJson(ratStatus),
      );
    } on NoInternetException {
      return Left(InternetConnectionFailure(message: 'No internet Connection'));
    } on ServerException catch (e) {
      return Left(InternetConnectionFailure(message: e.message.toString()));
    }
  }
}
