part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

// ignore: must_be_immutable
final class SignUpSuccess extends SignUpState {
  RegisterDataModel registerDataModel;

  SignUpSuccess(this.registerDataModel);
}

// ignore: must_be_immutable
final class SignUpFailure extends SignUpState {
  String message;
  SignUpFailure(this.message);
}

final class ValidateLoading extends SignUpState {}

// ignore: must_be_immutable
final class ValidateFailure extends SignUpState {
  String message;
  ValidateFailure(this.message);
}
