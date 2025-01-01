import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/api_constant.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/apiservices.dart';
import 'package:taxi_go_user_version/Features/Saved/data/repo/saved_repo.dart';
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

    return response.fold(((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }), (ifRight) {
      if (ifRight.data["status"] == false) {
        return Left(ServerFailure(message: ifRight.data["message"]));
      } else {
        SavedDataModel historyDataModel = SavedDataModel.fromJson(ifRight.data);

        return Right(historyDataModel);
      }
    });
  }

  @override
  Future<Either<Failure, UnSaveModel>> unSaveTrip(
      BuildContext context, int tripId) async {
    var response = await apiService.deleteRequest(
      '${Constants.baseUrl}${Constants.unSaveTripEndPoint}$tripId',
      context: context,
    );
    return response.fold(((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }), (ifRight) {
      if (ifRight.data["status"] == false) {
        return Left(ServerFailure(message: ifRight.data["message"]));
      } else {
        UnSaveModel unSaveModel = UnSaveModel.fromJson(ifRight.data);

        return Right(unSaveModel);
      }
    });
  }
}
