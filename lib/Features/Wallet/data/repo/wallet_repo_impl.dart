import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/api_constant.dart';
import 'package:taxi_go_user_version/Features/Wallet/data/model/get_all_transactions_model.dart';
import 'package:taxi_go_user_version/Features/Wallet/data/model/get_profile_model.dart';
import 'package:taxi_go_user_version/Features/Wallet/data/model/wallet_model.dart';
import 'package:taxi_go_user_version/Features/Wallet/data/repo/wallet_repo.dart';

import '../../../../Core/Utils/Network/Error/exception.dart';
import '../../../../Core/Utils/Network/Services/apiservices.dart';

class WalletRepoImpl extends WalletRepo {
  ApiService apiService;
  WalletRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, WalletModel>> getWallet(
      {required String amount, required dynamic context}) async {
    try {
      final response = await apiService.postRequest(
        context: context,
        Constants.depositURL(amount: amount),
      );
      return Right(WalletModel.fromJson(response));
    } on NoInternetException {
      return Left(InternetConnectionFailure(message: 'No internet Connection'));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message.toString()));
    }
  }
@override
  Future<Either<Failure, GetAllTransactionsModel>> getAllTransactions({
    String? paymentMethod,
    String? transactionType,
    required BuildContext context,
  }) async {
    try {
      // Construct the URL and log it for debugging
      final url = Constants.transactionsURL(
        paymentMethod: paymentMethod,
        transactionType: transactionType,
      );
      print('Constructed URL: $url');

      // Perform the API request and log the raw response
      final response = await apiService.getRequest(url, context: context);
      print('Raw API response: $response');

      // Parse the response and return the model
      return Right(GetAllTransactionsModel.fromJson(response));
    } on NoInternetException {
      print('Error: No internet connection');
      return Left(InternetConnectionFailure(message: 'No internet connection'));
    } on ServerException catch (e) {
      print('Error: ServerException - ${e.message}');
      return Left(ServerFailure(message: e.message.toString()));
    } catch (e) {
      print('Error: Unexpected exception - $e');
      return Left(ServerFailure(message: 'Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, GetProfileModel>> getProfile({required BuildContext context}) async {
    try {
      final url = Constants.getProfileURL();
      print('Constructed URL: $url');

      final response = await apiService.getRequest(url, context: context);
      print('Raw API response: $response');
      return Right(GetProfileModel.fromJson(response));
    } on NoInternetException {
      print('Error: No internet connection');
      return Left(InternetConnectionFailure(message: 'No internet connection'));
    } on ServerException catch (e) {
      print('Error: ServerException - ${e.message}');
      return Left(ServerFailure(message: e.message.toString()));
    } catch (e) {
      print('Error: Unexpected exception - $e');
      return Left(ServerFailure(message: 'Unexpected error: $e'));
    }
  }

}
