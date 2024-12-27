import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Features/Wallet/data/model/get_all_transactions_model.dart';
import 'package:taxi_go_user_version/Features/Wallet/data/model/get_profile_model.dart';
import 'package:taxi_go_user_version/Features/Wallet/data/model/wallet_model.dart';

import '../../../../Core/Utils/Network/Error/failure.dart';

abstract class WalletRepo {
  Future<Either<Failure, WalletModel>> getWallet({
    required String amount,
    required BuildContext context,
  });

  Future<Either<Failure, GetAllTransactionsModel>> getAllTransactions({
    String paymentMethod,
    String transactionType,
    required BuildContext context,
  });

  Future<Either<Failure, GetProfileModel>> getProfile({
    required BuildContext context,
  });
}
