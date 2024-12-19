import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Core/app_constants.dart';
import 'package:taxi_go_user_version/Features/App/app_widgets/custom_ErrorAnimation.dart';
import 'package:taxi_go_user_version/Features/App/app_widgets/custom_loading.dart';
import 'package:taxi_go_user_version/Features/Home/controller/rate_cubit/rete_cubit.dart';
import 'package:taxi_go_user_version/Features/Home/controller/ride_complete_cubit/ride_complete_details_cubit.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/tripe_complete_date.dart';

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
            print("Current state: $state");
            return state is RideCompleteDetailsLoading
                ? CustomLoading()
                : state is RideCompleteDetailsFailure
                    ? CustomErroranimation(
                        errormessage: state.message,
                        lottie: AppConstants.CatError,
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
          child: BlocBuilder<RateCubit, RateState>(
            builder: (context, state) {
              final rateCubit = context.read<RateCubit>();

              return ElevatedButton(
                onPressed: () {
                  rateCubit.confirmRate(context,
                      rateCubit.feedBackController.text, rateCubit.rate);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blueColor,
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: AutoSizeText(
                  AppLocalizations.of(context)!.submit,
                  style: AppTextStyles.style16WhiteW500,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
