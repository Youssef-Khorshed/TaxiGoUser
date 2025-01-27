import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Features/App/app_widgets/custom_ErrorAnimation.dart';
import 'package:taxi_go_user_version/Features/Wallet/controller/wallet_deposit_cubit/deposit_cubit.dart';
import '../../../../Core/Utils/Network/Services/services_locator.dart';
import '../../../../Core/Utils/Routing/app_routes.dart';
import '../../../../Core/Utils/Text/text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'wallet_actions_buttons_widget.dart';
import 'wallet_content_of_dialog_widget.dart';

class WalletAlertDialogWidget extends StatelessWidget {
  const WalletAlertDialogWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WalletCubit>(),
      child: BlocConsumer<WalletCubit, WalletState>(
        listener: (context, state) {
          if (state is WalletSuccess) {
            Navigator.of(context).popAndPushNamed(AppRoutes.webViewWalletScreen,arguments: state.walletModel.data);

          }
        },
        builder: (context, state) {
          final walletCubit = context.read<WalletCubit>();
          return Form(
            key: walletCubit.formKey,
            child: AlertDialog(
              title:
                  Center(child: Text(AppLocalizations.of(context)!.zain_Cash)),
              titleTextStyle: AppTextStyles.style18BlackW500,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r)),
              actionsAlignment: MainAxisAlignment.start,
              backgroundColor: AppColors.whiteColor,
              scrollable: true,
              actions: [
                if (state is WalletLoading) ...[
                  const Center(child: CircularProgressIndicator()),
                ] else if (state is WalletError) ...[
                  CustomErroranimation(
                    errormessage: AppLocalizations.of(context)!.error_occurred,
                    lottie: "",
                  ),
                ] else ...[
                  WalletActionsButtonsWidget(walletCubit: walletCubit)
                ],
              ],
              content: WalletContentOfDialogWidget(
                amountController: walletCubit.amountController,
              ),
            ),
          );
        },
      ),
    );
  }
}
