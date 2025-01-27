import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Features/notification/data/model/notification_model/notification_model.dart';
import 'package:taxi_go_user_version/Features/notification/data/repo/notification_repo.dart';

part 'get_all_notification_state.dart';

class GetAllNotificationCubit extends Cubit<GetAllNotificationState> {
  final NotificationRepo notificationRepo;
  NotificationModelData? getAllNotificationModel;
  GetAllNotificationCubit(this.notificationRepo)
      : super(GetAllNotificationInitial());

  Future<void> getAllNotification({required BuildContext context}) async {
    emit(GetAllNotificationLoading());
    final response =
        await notificationRepo.getAllNotification(context: context);
    response.fold(
      (onError) {
        emit(GetAllNotificationError());
      },
      (onSuccess) {
        getAllNotificationModel = onSuccess;
        emit(GetAllNotificationSuccess(
            getAllNotificationModel: getAllNotificationModel!));
      },
    );
  }
}
