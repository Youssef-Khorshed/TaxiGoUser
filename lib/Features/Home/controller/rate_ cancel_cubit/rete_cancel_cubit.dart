import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Features/Home/data/repos/cancle_repo/cancel_repo.dart';
import 'package:taxi_go_user_version/Features/Home/data/repos/tare_repo/rate_repo.dart';

part 'rete_cancel_state.dart';

class RateCancelCubit extends Cubit<RateCancelState> {
  RateCancelCubit(this.repo, this.cancelRepo) : super(RateInitial());
  final RateRepo repo;
  final CancelRepo cancelRepo;
  TextEditingController feedBackController = TextEditingController();
  GlobalKey<FormState> feedBackKey = GlobalKey<FormState>();

  double rate = 0.0;
  String comment = "";
  String reason = "";
  Future<void> confirmRate(context, String comment, double rate) async {
    print("**************************${state}");
    emit(RateLoading());
    final result = await repo.rateTrip(context, comment, rate);
    result.fold((failure) {
      emit(RateError(msg: failure.message));
      print("**************************${failure.message}");
    }, (response) {
      emit(RateSuccess(status: response.status));
      print("**************************${response.message}");
    });
  }

  Future<void> confirmCancel(context, String comment) async {
    print("**************************${state}");
    emit(CancelLoading());
    final result = await cancelRepo.cancel(context, comment);
    result.fold((failure) {
      emit(CancelError(msg: failure.message));
      print("**************************${failure.message}");
    }, (response) {
      emit(CancelSuccess(status: response.status));
      print("**************************${response.message}");
    });
  }

  void rateBtn(double rete) {
    rate = rete; // استخدم المعامل الصحيح (rete)
    emit(Rated());
  }

  void cancelBtn(String reason) {
    this.reason = reason; // استخدم المعامل الصحيح (rete)
    emit(Canceled());
  }
}
