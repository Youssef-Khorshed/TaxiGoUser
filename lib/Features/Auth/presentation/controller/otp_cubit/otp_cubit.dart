import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_go_user_version/Features/Auth/data/repo/auth_repo.dart';

import '../../../data/models/forget_password_model/Forget_password_model.dart';
import '../../../data/models/verify_account/verify_account.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit(this.auth) : super(OtpInitial());
  AuthRepo auth;
  static OtpCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController? controller = TextEditingController();

  Future<void> sendOtpEmailVerification(BuildContext context) async {
    emit(SendVerificationLoading());
    var result = await auth.sendVerificationCode(context);
    result.fold(
      (error) {
        emit(SendVerificationFailure(error.message));
      },
      (data) {
        if (data.status ?? false) {
          emit(SendVerificationSuccess(data.data));
        } else {
          emit(SendVerificationFailure(
              data.errors?.first ?? "error".toString()));
        }
      },
    );
  }

  Future<void> verifyAccount(BuildContext context, int otp) async {
    emit(VerifyAccountLoading());
    var result = await auth.verifyAccount(context, otp);
    result.fold(
      (error) {
        emit(VerifyAccountFailure(error.message));
      },
      (data) {
        if (data.status ?? false) {
          emit(VerifyAccountSuccess(data));
        } else {
          emit(VerifyAccountFailure(data.errors?.first.toString()));
        }
      },
    );
  }

  Future<void> forgetPassword(BuildContext context, String phone) async {
    emit(ForgetPassLoading());

    var result = await auth.forgetPassword(context, phone);
    result.fold(
      (error) {
        emit(ForgetPassFailure(error.message));
      },
      (data) {
        if (data.status ?? false) {
          emit(ForgetPassSuccess(data));
        } else {
          emit(ForgetPassFailure(data.errors?.first.toString()));
        }
      },
    );
  }

  Future<void> validateForgetPassword(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      await forgetPassword(context, controller!.text.toString());
    } else {
      autovalidateMode = AutovalidateMode.always;
    }
  }

  Future<void> forgotPasswordCheckCode(BuildContext context,
      {required int code, required String phone}) async {
    emit(SendVerificationLoading());
    var result =
        await auth.forgotPasswordCheckCode(context, otp: code, phone: phone);
    result.fold(
      (error) {
        emit(SendVerificationFailure(error.message));
      },
      (data) {
        if (data.status ?? false) {
          emit(SendVerificationSuccess(data.data));
        } else {
          emit(SendVerificationFailure(
              data.errors?.first ?? "Error".toString()));
        }
      },
    );
  }
}
