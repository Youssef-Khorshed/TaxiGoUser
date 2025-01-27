import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_go_user_version/Features/Wallet/controller/wallet_deposit_cubit/webpage.dart';
import 'package:taxi_go_user_version/Features/Wallet/data/repo/wallet_repo.dart';
import '../../data/model/wallet_model.dart';

part 'deposit_state.dart';

class WalletCubit extends Cubit<WalletState> {
  final WalletRepo walletRepo;
  WalletModel? walletModel;

  WalletCubit(this.walletRepo) : super(WalletInitial());

  final TextEditingController amountController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> getWallet(
      {required String amount, required BuildContext context}) async {
    emit(WalletLoading());

    final response =
        await walletRepo.getWallet(amount: amount, context: context);

    response.fold(
      (onError) {
        emit(WalletError());
      },
      (onSuccess) {
        walletModel = onSuccess;
        emit(WalletSuccess(walletModel: walletModel!));
      },
    );
  }

  Future<void> handleAddMoney({
    required BuildContext context,
    required String amount,
  }) async {
    await getWallet(amount: amount, context: context);

    if (walletModel != null) {
      final bool success = await tryLaunchUrl(context);
      if (!success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to proceed with payment")),
        );
      }
    }
  }

  Future<bool> tryLaunchUrl(BuildContext context) async {
    try {
      final Uri url = Uri.parse(walletModel!.data);
      if (url.hasScheme) {
        final result = await Navigator.push<bool>(
          context,
          MaterialPageRoute(
            builder: (context) => WebViewPage(url: url.toString()),
          ),
        );
        return result ?? false;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Invalid URL: ${walletModel!.data}")),
        );
        return false;
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
      return false;
    }
  }

  // Centralized validation function
  static String? validateAmount(String? value) {
    if (value == null || value.trim().isEmpty || value.length < 1001) {
      return "Please enter a valid amount.";
    }

    final number = double.tryParse(value.trim());
    if (number == null || number <= 0) {
      return "Amount must be a positive number.";
    }

    return null;
  }
}
