import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/api_constant.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/apiservices.dart';
import 'package:taxi_go_user_version/Core/app_constants.dart';
import 'package:taxi_go_user_version/Features/Favourite/data/favorite_data_model.dart';
import 'package:taxi_go_user_version/Features/Favourite/data/repo/favorite_repo.dart';

class FavoriteRepoImpl extends FavouriteRepo {
  ApiService apiService;
  FavoriteRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, FavoriteDataModel>> getData(
      BuildContext context) async {
    Response response = await apiService.getRequest(
        Constants.baseUrl + Constants.historyEndPoint,
        context: context,
        queryParameters: {
          'token': AppConstants.kTokenValue,
        });

    try {
      FavoriteDataModel favoriteDataModel =
          FavoriteDataModel.fromJson(response.data);
      if (response.statusCode! == 200 && response.statusCode! == 201) {
        return Right(favoriteDataModel);
      } else {
        return Left(ServerFailure.fromResponse(response.statusCode, response));
      }
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(message: e.toString()));
      }
    }
  }
}
