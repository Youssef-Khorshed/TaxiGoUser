import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_user_version/Features/Profile/data/profile_model.dart';

abstract class ProfileRepo {
  Future<Either<Failure, ProfielModel>> fetchUserInfo(BuildContext context);
}
