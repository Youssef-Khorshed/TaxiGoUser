// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/apiservices.dart';
import 'package:taxi_go_user_version/Features/notification/data/model/notification_model/notification_model.dart';
import '../../../../Core/Utils/Network/Services/api_constant.dart';
import 'notification_repo.dart';

class NotificationRepoImpl extends NotificationRepo {
  ApiService apiService;

  NotificationRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, NotificationModelData>> getAllNotification(
      {required BuildContext context}) async {
    final response = await apiService.getRequest(
      context: context,
      Constants.getAllNotificationURL(),
    );
    return response.fold(((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }), (ifRight) {
      if (ifRight.data["status"] == false) {
        return Left(ServerFailure(message: ifRight.data["message"]));
      } else {
        return Right(NotificationModelData.fromJson(ifRight.data));
      }
    });
  }
}
