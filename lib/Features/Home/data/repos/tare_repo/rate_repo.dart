import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_user_version/Features/Home/data/models/rete_model/rate_model.dart';

abstract class RateRepo {
  Future<Either<Failure, RateModel>> rateTrip(
      BuildContext context, String comment, double rate);
}
