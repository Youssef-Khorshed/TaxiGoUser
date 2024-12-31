import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/secure_profile.dart';

import '../../../../../../Core/Utils/Network/Services/secure_token.dart';
import '../../../data/repo/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginInRepo) : super(LoginInitial());
  AuthRepo loginInRepo;
  static LoginCubit get(context) => BlocProvider.of(context);

  TextEditingController loginPhoneController = TextEditingController();
  TextEditingController loginPassController = TextEditingController();
  AutovalidateMode loginAutoValidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  Future<void> login(
      {required String phone,
      required String password,
      required BuildContext context}) async {
    emit(LoginInLoading());
    var result = await loginInRepo.signIn(
        phone: phone, password: password, context: context);
    result.fold((error) {
      emit(LoginInError(errorMessage: error.message));
    }, (data) async {
      if (data.status == true) {
        await SecureToken.addToken(data.data!.token!);
        await SecureProfile.addProfileImage(data.data!.user!.picture!);
        await SecureProfile.addProfileName(data.data!.user!.name!);

        emit(LoginInSuccess());
      } else {
        emit(LoginInError(errorMessage: data.message ?? "error"));
      }
    });
  }

  Future<void> loginValidate(BuildContext context) async {
    if (loginFormKey.currentState!.validate()) {
      loginFormKey.currentState!.save();

      login(
          password: loginPassController.text,
          phone: loginPhoneController.text,
          context: context);
    } else {
      loginAutoValidateMode = AutovalidateMode.always;
    }
  }
}
