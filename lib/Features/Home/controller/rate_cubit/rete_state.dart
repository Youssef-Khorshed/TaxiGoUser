part of 'rete_cubit.dart';

@immutable
sealed class RateState {}

final class RateInitial extends RateState {}

final class RateLoading extends RateState {}

final class Rated extends RateState {}

final class RateSuccess extends RateState {
  final String msg;

  RateSuccess({required this.msg});
}

final class RateError extends RateState {
  final String msg;

  RateError({required this.msg});
}
