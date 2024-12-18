import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_go_user_version/Features/History/controller/history_states.dart';
import 'package:taxi_go_user_version/Features/History/data/repo/history_repo.dart';

class HistoryViewModel extends Cubit<HistoryStates> {
  HistoryViewModel({required this.historyRepo}) : super(HistoryLoadingStates());
  HistoryRepo historyRepo;

  static HistoryViewModel get(context) => BlocProvider.of(context);
  getHistoryData(BuildContext context) async {
    emit(HistoryLoadingStates());
    var either = await historyRepo.getData(context);
    either.fold(
      (historyFailure) {
        emit(HistoryFailureStates(errMessage: historyFailure.message));
      },
      (historyResponse) {
        emit(HistorySuccessStates(historyDataModel: historyResponse));
      },
    );
  }
}
