import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_go_user_version/Features/Saved/controller/saved_states.dart';
import 'package:taxi_go_user_version/Features/Saved/data/repo/saved_repo.dart';

class SavedViewModel extends Cubit<SavedStates> {
  SavedViewModel({required this.savedRepo}) : super(SavedLoadingStates());
  final SavedRepo savedRepo;

  static SavedViewModel get(context) => BlocProvider.of(context);
  getSavedData(BuildContext context, {String? tripHistory}) async {
    emit(SavedLoadingStates());
    var either = await savedRepo.getAllSavedData(context);
    either.fold(
      (savedFailure) {
        emit(SavedFailureStates(errMessage: savedFailure.message));
      },
      (savedResponse) {
        emit(SavedSuccessStates(savedDataModel: savedResponse));
      },
    );
  }
}
