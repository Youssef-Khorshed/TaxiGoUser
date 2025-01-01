import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/api_constant.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/apiservices.dart';
import 'package:taxi_go_user_version/Features/Favourite/data/favorite_data_model.dart';
import 'package:taxi_go_user_version/Features/Favourite/data/repo/favorite_repo.dart';
import 'package:taxi_go_user_version/Features/Favourite/data/rmove_favorite_model.dart';

class FavoriteRepoImpl extends FavouriteRepo {
  ApiService apiService;
  FavoriteRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, FavoriteDataModel>> getData(
      BuildContext context) async {
    var response = await apiService.getRequest(
      Constants.baseUrl + Constants.favoriteEndPoint,
      context: context,
    );

    return response.fold(((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }), (ifRight) {
      if (ifRight.data["status"] == false) {
        return Left(ServerFailure(message: ifRight.data["message"]));
      } else {
        FavoriteDataModel favoriteDataModel =
            FavoriteDataModel.fromJson(ifRight.data);
        return Right(favoriteDataModel);
      }
    });
  }

  @override
  Future<Either<Failure, RemoveFavoriteModel>> removeFavTrip(
      BuildContext context, int tripId) async {
    var response = await apiService.deleteRequest(
      '${Constants.baseUrl}${Constants.removefavoriteEndPoint}$tripId',
      context: context,
    );
    return response.fold(((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }), (ifRight) {
      if (ifRight.data["status"] == false) {
        return Left(ServerFailure(message: ifRight.data["message"]));
      } else {
        RemoveFavoriteModel unSaveModel =
            RemoveFavoriteModel.fromJson(ifRight.data);
        return Right(unSaveModel);
      }
    });
  }
}
