// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_countDownTimer.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/map_cubit/mapCubit.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/map_cubit/mapState.dart';
import 'package:taxi_go_user_version/Features/Map/screens/trip_screen.dart';

// ignore: must_be_immutable
class CustomSearchingDriverSheet extends StatelessWidget {
  String originTitle;
  String originSubTitle;
  String destinationTitle;
  String destinationSubTitle;
  String distance;
  String time;
  CustomSearchingDriverSheet({
    super.key,
    required this.originTitle,
    required this.originSubTitle,
    required this.destinationTitle,
    required this.destinationSubTitle,
    required this.distance,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<MapsCubit, MapsState>(
      listener: (context, state) {
        final state = context.read<MapsCubit>().state;
        final cubit = context.read<MapsCubit>();

        if (state is GetActiveRideRequestSuccess) {
          Fluttertoast.showToast(msg: AppLocalizations.of(context)!.ride_is_accepted);
          Navigator.pop(context);
          Navigator.of(context).push(CupertinoPageRoute(
              builder: (_) => TripScreen(
                    activeRide: state.activeRide,
                  )));
        }

        if (state is GetActiveRideRequestNoTrips) {
          cubit.canelRideRequest(context: context);
          Fluttertoast.showToast(msg: AppLocalizations.of(context)!.request_not_accepted_try_again);
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.0.h),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.darkgrayColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
            height: 5.h,
            width: 134.w,
          ),
          verticalSpace(20.h),
          Row(
            children: [
              const Spacer(),
              AutoSizeText(
                AppLocalizations.of(context)!.searching_for_a_driver,
                style: AppTextStyles.style18BlueBold,
              ),
              const Spacer(),
            ],
          ),
          verticalSpace(20.h),
          const CustomCountdowntimer(),
          verticalSpace(20.h),
          AutoSizeText(
            AppLocalizations.of(context)!.loading,
            style: AppTextStyles.style18BlueBold,
          ),
          verticalSpace(20.h),
        ]),
      ),
    );
  }
}
