import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/secure_profile.dart';

import '../../../../../../Core/Utils/Network/Services/secure_token.dart';

import '../../../data/models/log_out/Log_out_model.dart';
import '../../../data/repo/auth_repo.dart';

part 'log_out_state.dart';

class LogOutCubit extends Cubit<LogOutState> {
  AuthRepo authRepo;
  LogOutCubit(this.authRepo) : super(LogOutInitial());
  static LogOutCubit get(context) => BlocProvider.of(context);

  Future<void> logOut(BuildContext context) async {
    emit(LogOutLoading());
    var result = await authRepo.logout(context);
    result.fold(
      (error) {
        emit(LogOutError(message: error.message));
      },
      (data) async {
        if (data.status ?? false) {
          await SecureToken.deleteToken();
          await SecureProfile.deleteProfileImage();
          await SecureProfile.deleteProfileName();

          emit(LogOutSuccess(data: data));
        } else {
          emit((data.errors?.first ?? "error".toString()));
        }
      },
    );
  }
}
