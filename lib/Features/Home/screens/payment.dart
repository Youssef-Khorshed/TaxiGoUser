import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Assets/lottie/lottie.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Core/Utils/app_custom_widgets/custom_app_bottom.dart';
import 'package:taxi_go_user_version/Features/App/app_widgets/custom_ErrorAnimation.dart';
import 'package:taxi_go_user_version/Features/App/app_widgets/custom_loading.dart';
import 'package:taxi_go_user_version/Features/Home/controller/ride_complete_cubit/ride_complete_details_cubit.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/tripe_complete_date.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return const Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: PaymentsDetailsBlockBuilder(),
    );
  }
}

class PaymentsDetailsBlockBuilder extends StatelessWidget {
  const PaymentsDetailsBlockBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RideCompleteDetailsCubit, RideCompleteDetailsState>(
      builder: (context, state) {
        final cubit = context.read<RideCompleteDetailsCubit>();
        if (state is RideCompleteDetailsInitial) {
          cubit.getRideCompleteDetails(context);
        }
        print("Current state: $state");
        return state is RideCompleteDetailsLoading
            ? const CustomLoading()
            : state is RideCompleteDetailsFailure
                ? CustomErroranimation(
                    errormessage: state.message,
                    lottie: AppLottie.catError,
                  )
                : state is RideCompleteDetailsSuccess
                    ? ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05),
                        children: [
                          verticalSpace(50),
                          Center(
                            child: AutoSizeText(
                              AppLocalizations.of(context)!.payment,
                              style: AppTextStyles.style18BlackW500,
                            ),
                          ),
                          verticalSpace(10),
                          Divider(color: AppColors.grayColor, height: .7.h),
                          TripeCompleteDate(
                            rideCompleteDetailsModel:
                                state.rideCompleteDetailsModel,
                          ),
                          verticalSpace(
                              MediaQuery.of(context).size.height * .30),
                          CustomAppBottom(
                            buttonText: AppLocalizations.of(context)!.confirm,
                            borderCornerRadius: 8,
                            onPressed: () {
                              Navigator.of(context).pushNamed(AppRoutes.rate);
                            },
                          ),
                        ],
                      )
                    : Container();
      },
    );
  }
}
