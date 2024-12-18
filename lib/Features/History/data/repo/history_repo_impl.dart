import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
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
  Future<Either<Failure, HistoryDataModel>> getData(
      BuildContext context) async {
    var response = await apiService.getRequest(
      Constants.baseUrl + Constants.historyEndPoint,
      context: context,
    );

    try {
      HistoryDataModel historyDataModel = HistoryDataModel.fromJson(response);

      return Right(historyDataModel);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(message: e.toString()));
      }
    }
  }
}
