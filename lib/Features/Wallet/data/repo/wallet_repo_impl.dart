import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/api_constant.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/apiservices.dart';
import 'package:taxi_go_user_version/Features/Wallet/data/model/get_all_transactions_model.dart';
import 'package:taxi_go_user_version/Features/Wallet/data/model/get_profile_model.dart';
import 'package:taxi_go_user_version/Features/Wallet/data/model/wallet_model.dart';
import 'package:taxi_go_user_version/Features/Wallet/data/repo/wallet_repo.dart';

class WalletRepoImpl extends WalletRepo {
  ApiService apiService;
  WalletRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, WalletModel>> getWallet(
      {required String amount, required dynamic context}) async {
    final response = await apiService.postRequest(
      context: context,
      Constants.depositURL(amount: amount),
    );
    return response.fold(((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }), (ifRight) {
      if (ifRight.data["status"] == false) {
        return Left(ServerFailure(message: ifRight.data["message"]));
      } else {
        return Right(WalletModel.fromJson(ifRight.data));
      }
    });
  }

  @override
  Future<Either<Failure, GetAllTransactionsModel>> getAllTransactions({
    String? paymentMethod,
    String? transactionType,
    required BuildContext context,
  }) async {
    final url = Constants.transactionsURL(
      paymentMethod: paymentMethod,
      transactionType: transactionType,
    );

    final response = await apiService.getRequest(url, context: context);

    return response.fold(((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }), (ifRight) {
      if (ifRight.data["status"] == false) {
        return Left(ServerFailure(message: ifRight.data["message"]));
      } else {
        return Right(GetAllTransactionsModel.fromJson(ifRight.data));
      }
    });
  }

  @override
  Future<Either<Failure, GetProfileModel>> getProfile(
      {required BuildContext context}) async {
    final url = Constants.getProfileURL();
    final response = await apiService.getRequest(url, context: context);

    return response.fold(((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }), (ifRight) {
      if (ifRight.data["status"] == false) {
        return Left(ServerFailure(message: ifRight.data["message"]));
      } else {
        return Right(GetProfileModel.fromJson(ifRight.data));
      }
    });
  }
}
