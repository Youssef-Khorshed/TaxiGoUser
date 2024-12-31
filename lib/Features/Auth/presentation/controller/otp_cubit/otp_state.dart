part of 'otp_cubit.dart';

@immutable
sealed class OtpState {}

final class OtpInitial extends OtpState {}

//send verification loading
final class SendVerificationLoading extends OtpState {}

// ignore: must_be_immutable
class SendVerificationSuccess extends OtpState {
  final List<int>? data;

  SendVerificationSuccess(this.data);
}

class SendVerificationFailure extends OtpState {
  final String error;
  SendVerificationFailure(this.error);
}

class VerifyAccountLoading extends OtpState {}

// ignore: must_be_immutable
final class VerifyAccountSuccess extends OtpState {
  VerifyAccount? data;
  VerifyAccountSuccess(this.data);
}

// ignore: must_be_immutable
final class VerifyAccountFailure extends OtpState {
  String? error;
  VerifyAccountFailure(this.error);
}

final class ForgetPassLoading extends OtpState {}

class ForgetPassSuccess extends OtpState {
  final ForgetPasswordModel? data;
  ForgetPassSuccess(this.data);
}

class ForgetPassFailure extends OtpState {
  final String? error;
  ForgetPassFailure(this.error);
}
