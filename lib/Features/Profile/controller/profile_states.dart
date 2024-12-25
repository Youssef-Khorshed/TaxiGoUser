import 'package:taxi_go_user_version/Features/Profile/data/profile_model.dart';

abstract class ProfileStates {}

class ProfileLoadingStates extends ProfileStates {}

class ProfileFailureStates extends ProfileStates {
  final String errMessage;
  ProfileFailureStates({required this.errMessage});
}

class ProfileSuccessStates extends ProfileStates {
  final ProfielModel profielModel;
  ProfileSuccessStates({required this.profielModel});
}
