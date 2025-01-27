import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Features/notification/data/model/notification_model/notification_model.dart';
import '../../../../Core/Utils/Network/Error/failure.dart';

abstract class NotificationRepo {
  Future<Either<Failure, NotificationModelData>> getAllNotification({
    required BuildContext context,
  });
}
