import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_user_version/Features/Favourite/data/favorite_data_model.dart';

abstract class FavoriteRepo {
  Future<Either<Failure, FavoriteDataModel>> getData(BuildContext context);
}
