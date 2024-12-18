import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Features/Home/data/repos/tare_repo/rate_repo.dart';

part 'rete_state.dart';

class RateCubit extends Cubit<RateState> {
  RateCubit(this.repo) : super(RateInitial());
  final RateRepo repo;
  TextEditingController feedBackController = TextEditingController();
  GlobalKey<FormState> feedBackKey = GlobalKey<FormState>();

  double rate = 0.0;
  String comment = "";
  Future<void> confirmRate(context, String comment, double rate) async {
    print("**************************${state}");
    emit(RateLoading());
    final result = await repo.rateTrip(context, comment, rate);
    result.fold((failure) {
      emit(RateError(msg: failure.message));
      print("**************************${failure.message}");
    }, (response) {
      emit(RateSuccess(msg: response.message));
      print("**************************${response.message}");
    });
  }

  void rateBtn(double rete) {
    rate = rete; // استخدم المعامل الصحيح (rete)
    emit(Rated());
  }
}
