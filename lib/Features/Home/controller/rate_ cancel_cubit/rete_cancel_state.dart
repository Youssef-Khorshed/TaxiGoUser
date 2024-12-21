part of 'rete_cancel_cubit.dart';

@immutable
sealed class RateCancelState {}

final class RateInitial extends RateCancelState {}

final class RateLoading extends RateCancelState {}

final class Rated extends RateCancelState {}

final class Canceled extends RateCancelState {}

final class RateSuccess extends RateCancelState {
  final bool status;

  RateSuccess({required this.status});
}

final class RateError extends RateCancelState {
  final String msg;

  RateError({required this.msg});
}

final class CancelLoading extends RateCancelState {}

final class CancelSuccess extends RateCancelState {
  final bool status;

  CancelSuccess({required this.status});
}

final class CancelError extends RateCancelState {
  final String msg;

  CancelError({required this.msg});
}
