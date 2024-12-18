import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_go_user_version/Features/History/controller/history_states.dart';
import 'package:taxi_go_user_version/Features/History/data/repo/history_repo.dart';

class HistoryViewModel extends Cubit<HistoryStates> {
  HistoryViewModel({required this.favoriteRepo})
      : super(HistoryLoadingStates());
  HistoryRepo favoriteRepo;

  static HistoryViewModel get(context) => BlocProvider.of(context);
  getFavouriteDate(BuildContext context) async {
    emit(HistoryLoadingStates());
    var either = await favoriteRepo.getData(context);
    either.fold(
      (historyFailure) {
        log('favouriteFailure ============================ $historyFailure');
        emit(HistoryFailureStates(errMessage: historyFailure.message));
      },
      (historyResponse) {
        log('favourite data =============================================== $historyResponse');
        emit(HistorySuccessStates(historyDataModel: historyResponse));
      },
    );
  }
}
