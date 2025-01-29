import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taxi_go_user_version/Core/Utils/Assets/lottie/lottie.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Features/App/app_widgets/custom_ErrorAnimation.dart';
import 'package:taxi_go_user_version/Features/App/app_widgets/custom_loading.dart';
import 'package:taxi_go_user_version/Features/Home/controller/rate_%20cancel_cubit/rete_cancel_cubit.dart';
import 'package:taxi_go_user_version/Features/Home/controller/ride_complete_cubit/ride_complete_details_cubit.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/rate_btn.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/map_cubit/mapCubit.dart';

import 'tripe_complete_date.dart';

class RateDetailsBlockBuilder extends StatelessWidget {
  const RateDetailsBlockBuilder({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<RideCompleteDetailsCubit, RideCompleteDetailsState>(
          builder: (context, state) {
            final cubit = context.read<RideCompleteDetailsCubit>();
            if (state is RideCompleteDetailsInitial) {
              cubit.getRideCompleteDetails(context);
            }
            log("Current state: $state");
            return state is RideCompleteDetailsLoading
                ? const CustomLoading()
                : state is RideCompleteDetailsFailure
                    ? CustomErroranimation(
                        errormessage: state.message,
                        lottie: AppLottie.catError,
                      )
                    : state is RideCompleteDetailsSuccess
                        ? TripeCompleteDate(
                            rideCompleteDetailsModel:
                                state.rideCompleteDetailsModel,
                          )
                        : Container();
          },
        ),
        verticalSpace(size.height * 0.005),
        verticalSpace(15.h),
        SizedBox(
          width: double.infinity,
          child: BlocConsumer<RateCancelCubit, RateCancelState>(
            listener: (context, state) => () {
              if (state is RateError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "يجب أن يكون حقل rate على الأقل 1.",
                      style: TextStyle(color: Colors.black),
                    ),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },
            builder: (context, state) {
              final rateCubit = context.read<RateCancelCubit>();

              return RateButton(
                onValidRateWithFeedback: () {
                  rateCubit.confirmRate(context,
                      rateCubit.feedBackController.text, rateCubit.rate);
                  Navigator.pushReplacementNamed(
                      context, AppRoutes.generalScreen);
                  Fluttertoast.showToast(
                      msg: AppLocalizations.of(context)!
                          .thank_you_for_your_review);
                },
                onValidRateWithoutFeedback: () {
                  rateCubit.confirmRate(context,
                      rateCubit.feedBackController.text, rateCubit.rate);
                  Fluttertoast.showToast(
                      msg: AppLocalizations.of(context)!
                          .thank_you_for_your_review);

                  Future.delayed(const Duration(seconds: 1), () {}).then(
                    (_) => Navigator.pushReplacementNamed(
                      context,
                      AppRoutes.generalScreen,
                    ),
                  );
                },
                onInvalidRateWithFeedback: () {
                  Fluttertoast.showToast(
                      msg: AppLocalizations.of(context)!.please_rate_the_trip);
                },
                onInvalidRateWithoutFeedback: () {
                  context.read<MapsCubit>().clearMarkerPolyines();
                  Navigator.pushReplacementNamed(
                      context, AppRoutes.generalScreen);
                },
                buttonText: AppLocalizations.of(context)!.submit,
                feedbackController: rateCubit.feedBackController,
                rate: rateCubit.rate,
                backgroundColor: AppColors.blueColor,
                textStyle: AppTextStyles.style16WhiteW500,
                padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
              );
            },
          ),
        ),
      ],
    );
  }
}
