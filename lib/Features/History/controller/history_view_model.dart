import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_go_user_version/Features/History/controller/history_states.dart';
import 'package:taxi_go_user_version/Features/History/data/history_data_model.dart';
import 'package:taxi_go_user_version/Features/History/data/repo/history_repo.dart';

class HistoryViewModel extends Cubit<HistoryStates> {
  HistoryViewModel({required this.historyRepo}) : super(HistoryLoadingStates());
  HistoryRepo historyRepo;

  List<HistoryData> historyData = [];

  static HistoryViewModel get(context) => BlocProvider.of(context);
  getHistoryData(BuildContext context, {String? tripHistory}) async {
    emit(HistoryLoadingStates());
    var either = await historyRepo.getData(context, tripHistory: tripHistory);
    either.fold(
      (historyFailure) {
        emit(HistoryFailureStates(errMessage: historyFailure.message));
      },
      (historyResponse) {
        historyData = historyResponse.data!;
        emit(HistorySuccessStates(historyDataModel: historyResponse));
      },
    );
  }
}
