// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:taxi_go_user_version/Features/Wallet/data/model/get_profile_model.dart';

import '../../../data/repo/wallet_repo.dart';

part 'wallet_get_profile_state.dart';

class WalletGetProfileCubit extends Cubit<WalletGetProfileState> {
  final WalletRepo walletRepo;
  GetProfileModel? getProfileModel;
  WalletGetProfileCubit(
    this.walletRepo,
  ) : super(WalletGetProfileInitial());

  Future<void> getProfile({required BuildContext context}) async {
    emit(WalletGetProfileLoading());
    final response = await walletRepo.getProfile(context: context);
    response.fold(
      (onError) {
        log(onError.message);
        emit(WalletGetProfileError());
      },
      (onSuccess) {
        getProfileModel = onSuccess;
        emit(WalletGetProfileSuccess(getProfileModel: getProfileModel!));
      },
    );
  }
}
