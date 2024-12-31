import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Features/Wallet/data/model/get_all_transactions_model.dart';

import '../../../data/repo/wallet_repo.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  final WalletRepo walletRepo;
  GetAllTransactionsModel? getAllTransactionsModel;

  TransactionCubit(this.walletRepo) : super(TransactionInitial());

  Future<void> getAllTransactions({
    String? paymentMethod,
    String? transactionType,
    required BuildContext context,
  }) async {
    emit(TransactionLoading());

    final response = await walletRepo.getAllTransactions(
      paymentMethod: paymentMethod ?? '',
      transactionType: transactionType ?? '',
      context: context,
    );

    response.fold(
      (onError) {
        emit(TransactionError());
      },
      (onSuccess) {
        getAllTransactionsModel = onSuccess;
        emit(TransactionSuccess(transactionModel: getAllTransactionsModel!));
      },
    );
  }
}
