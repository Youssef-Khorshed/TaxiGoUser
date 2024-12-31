part of 'log_out_cubit.dart';

@immutable
sealed class LogOutState {}

final class LogOutInitial extends LogOutState {}

final class LogOutLoading extends LogOutState {}

// ignore: must_be_immutable
final class LogOutSuccess extends LogOutState {
  LogOutModel data;
  LogOutSuccess({required this.data});
}

// ignore: must_be_immutable
final class LogOutError extends LogOutState {
  String message;
  LogOutError({required this.message});
}
