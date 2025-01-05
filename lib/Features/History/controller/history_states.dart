import 'package:taxi_go_user_version/Features/History/data/history_data_model.dart';

abstract class HistoryStates {}

class HistoryLoadingStates extends HistoryStates {}

class HistoryFailureStates extends HistoryStates {
  final String errMessage;
  HistoryFailureStates({required this.errMessage});
}

class HistoryInitalizeSelectedValue extends HistoryStates {
  String selected;
  HistoryInitalizeSelectedValue({required this.selected});
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

class ChangeItemDropDown extends HistoryStates {
  final String item;
  ChangeItemDropDown({required this.item});
}
