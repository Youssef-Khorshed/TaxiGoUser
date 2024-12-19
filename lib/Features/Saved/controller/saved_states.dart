import 'package:taxi_go_user_version/Features/Saved/data/saved_data_model.dart';

abstract class SavedStates {}

class SavedLoadingStates extends SavedStates {}

class SavedFailureStates extends SavedStates {
  final String errMessage;
  SavedFailureStates({required this.errMessage});
}

class SavedSuccessStates extends SavedStates {
  final SavedDataModel savedDataModel;
  SavedSuccessStates({required this.savedDataModel});
}
