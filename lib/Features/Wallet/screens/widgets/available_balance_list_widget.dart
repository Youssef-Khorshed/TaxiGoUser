import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/services_locator.dart';
import 'package:taxi_go_user_version/Features/Wallet/controller/wallet_get_profile_cubit/cubit/wallet_get_profile_cubit.dart';
import '../../../../Core/Utils/Text/text_style.dart';
import 'avaliable_balance_continer_widget.dart';

class AvailableBalanceListWidget extends StatelessWidget {
  const AvailableBalanceListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<WalletGetProfileCubit>()..getProfile(context: context),
      child: BlocBuilder<WalletGetProfileCubit, WalletGetProfileState>(
        builder: (context, state) {
          final walletGetProfileCubit = context.read<WalletGetProfileCubit>();
          if (state is WalletGetProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WalletGetProfileSuccess) {
            return AvaliableBalanceItemWidget(
              amount: walletGetProfileCubit.getProfileModel!.data!.balance
                  .toString(),
            );
          } else if (state is WalletGetProfileError) {
            return AutoSizeText(
              "error ",
              style: AppTextStyles.style16BlackW600,
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
