import 'package:taxi_go_user_version/Features/History/data/history_data_model.dart';
import 'package:taxi_go_user_version/Features/History/data/save_trip_model.dart';

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

class SaveTripLoadingStates extends HistoryStates {}

class SaveTripFailureStates extends HistoryStates {
  final String errMessage;
  SaveTripFailureStates({required this.errMessage});
}

class SaveTripSuccessStates extends HistoryStates {
  final SaveTripModel saveTripModel;
  SaveTripSuccessStates({required this.saveTripModel});
}
