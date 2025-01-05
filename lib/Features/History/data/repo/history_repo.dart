import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_user_version/Features/History/data/history_data_model.dart';

abstract class HistoryRepo {
  Future<Either<Failure, HistoryDataModel>> getData(BuildContext context,
      {String? tripHistory});
}
