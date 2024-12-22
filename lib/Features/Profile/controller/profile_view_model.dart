import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_go_user_version/Features/Profile/controller/profile_states.dart';
import 'package:taxi_go_user_version/Features/Profile/data/repo/profile_repo.dart';

class ProfileViewModel extends Cubit<ProfileStates> {
  ProfileRepo profileRepo;
  ProfileViewModel({required this.profileRepo}) : super(ProfileLoadingStates());
  fetchPrfaileInfo(BuildContext context) async {
    emit(ProfileLoadingStates());
    var either = await profileRepo.fetchUserInfo(context);
    either.fold(
      (error) {
        emit(ProfileFailureStates(errMessage: error.message));
      },
      (profileModel) {
        emit(ProfileSuccessStates(profielModel: profileModel));
      },
    );
  }
}
