import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_user_version/Features/Home/data/models/ride_complete_model/ride_complete_details_model.dart';

abstract class RideCompleteRepo {
  Future<Either<Failure, RideCompleteDetailsModel>> getRideCompleteDetails(
      BuildContext context);
}
