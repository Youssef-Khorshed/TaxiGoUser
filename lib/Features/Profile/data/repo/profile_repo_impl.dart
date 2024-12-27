import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Error/exception.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/api_constant.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/apiservices.dart';
import 'package:taxi_go_user_version/Features/Profile/data/profile_model.dart';
import 'package:taxi_go_user_version/Features/Profile/data/repo/profile_repo.dart';

class ProfileRepoImpl extends ProfileRepo {
  ApiService apiService;
  ProfileRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, ProfielModel>> fetchUserInfo(
      BuildContext context) async {
    var response = await apiService.getRequest(
        Constants.baseUrl + Constants.profileEndPoint,
        context: context);
    try {
      ProfielModel profielModel = ProfielModel.fromJson(response);

      return Right(profielModel);
    } on NoInternetException {
      return Left(InternetConnectionFailure(message: 'No internet Connection'));
    } on ServerException catch (e) {
      return Left(InternetConnectionFailure(message: e.message.toString()));
    }
  }
}
