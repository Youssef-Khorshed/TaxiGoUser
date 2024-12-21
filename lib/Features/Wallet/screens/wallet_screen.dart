import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Features/Wallet/controller/wallet_get_profile_cubit/cubit/wallet_get_profile_cubit.dart';
import 'package:taxi_go_user_version/Features/Wallet/screens/widgets/transactions_list_widgte.dart';
import '../../../Core/Utils/Colors/app_colors.dart';
import '../../../Core/Utils/Network/Services/services_locator.dart';
import 'widgets/avaliable_balance_continer_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocProvider(
              create: (context) =>
                  getIt<WalletGetProfileCubit>()..getProfile(context: context),
              child: BlocBuilder<WalletGetProfileCubit, WalletGetProfileState>(
                builder: (context, state) {
                  final walletGetProfileCubit =
                      context.read<WalletGetProfileCubit>();
                  if (state is WalletGetProfileLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is WalletGetProfileSuccess) {
                    return AvaliableBalanceContinerWidget(
                      amount: walletGetProfileCubit
                          .getProfileModel!.data!.balance
                          .toString(),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
            verticalSpace(10),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.notificationScreen);
                },
                child: Icon(Icons.notification_add_rounded,
                    color: AppColors.darkgrayColor)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: AutoSizeText(AppLocalizations.of(context)!.transactions,
                  style: AppTextStyles.style16BlackW600),
            ),
            const Expanded(
              child: TransactionsListWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
