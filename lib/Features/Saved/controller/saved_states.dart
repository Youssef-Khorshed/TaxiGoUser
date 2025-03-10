import 'package:taxi_go_user_version/Features/History/data/save_trip_model.dart';
import 'package:taxi_go_user_version/Features/Saved/data/saved_data_model.dart';
import 'package:taxi_go_user_version/Features/Saved/data/un_save_model.dart';

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

class UnSaveTripFailureStates extends SavedStates {
  final String errMessage;
  UnSaveTripFailureStates({required this.errMessage});
}

class UnSaveTripSuccessStates extends SavedStates {
  final UnSaveModel unSaveModel;
  UnSaveTripSuccessStates({required this.unSaveModel});
}

class SaveTripSuccessStates extends SavedStates {
  AddToSaveToFavTripModel saveModel;
  SaveTripSuccessStates({required this.saveModel});
}
