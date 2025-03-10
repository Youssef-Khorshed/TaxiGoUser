import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/api_constant.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/apiservices.dart';
import 'package:taxi_go_user_version/Features/History/data/history_data_model.dart';
import 'package:taxi_go_user_version/Features/History/data/repo/history_repo.dart';

class HistoryRepoImpl extends HistoryRepo {
  ApiService apiService;
  HistoryRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, HistoryDataModel>> getData(BuildContext context,
      {String? tripHistory}) async {
    var response = await apiService.getRequest(
      "${Constants.baseUrl}${Constants.historyEndPoint}$tripHistory",
      context: context,
    );
    return response.fold(((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }), (ifRight) {
      if (ifRight.data["status"] == false) {
        return Left(ServerFailure(message: ifRight.data["message"]));
      } else {
        HistoryDataModel historyDataModel =
            HistoryDataModel.fromJson(ifRight.data);
        log(historyDataModel.data!.length.toString());

        return Right(historyDataModel);
      }
    });
  }
}
