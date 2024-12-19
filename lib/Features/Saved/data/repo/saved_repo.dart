import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_user_version/Features/Saved/data/save_trip_model.dart';
import 'package:taxi_go_user_version/Features/Saved/data/saved_data_model.dart';
import 'package:taxi_go_user_version/Features/Saved/data/un_save_model.dart';

abstract class SavedRepo {
  Future<Either<Failure, SavedDataModel>> getAllSavedData(BuildContext context);
  Future<Either<Failure, SaveTripModel>> saveTrip(
      BuildContext context, int rideId);
  Future<Either<Failure, UnSaveModel>> unSaveTrip(
      BuildContext context, String tripId);
}
