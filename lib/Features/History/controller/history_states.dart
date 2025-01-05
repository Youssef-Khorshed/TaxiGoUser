import 'package:taxi_go_user_version/Features/History/data/history_data_model.dart';

abstract class HistoryStates {}

class HistoryLoadingStates extends HistoryStates {}

class HistoryFailureStates extends HistoryStates {
  final String errMessage;
  HistoryFailureStates({required this.errMessage});
}

class HistorySuccessStates extends HistoryStates {
  final HistoryDataModel historyDataModel;
  HistorySuccessStates({required this.historyDataModel});
}

class AddToSaveToFavTripLoadingStates extends HistoryStates {}

class AddToSaveToFavFailureStates extends HistoryStates {
  final String errMessage;
  AddToSaveToFavFailureStates({required this.errMessage});
}
