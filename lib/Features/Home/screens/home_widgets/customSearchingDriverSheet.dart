// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_countDownTimer.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/map_cubit/mapCubit.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/map_cubit/mapState.dart';
import 'package:taxi_go_user_version/Features/Map/Data/model/rideRequestModel/ride/rideRequest.dart';
import 'package:taxi_go_user_version/Features/Map/screens/trip_screen.dart';

// ignore: must_be_immutable
class CustomSearchingDriverSheet extends StatelessWidget {
  String originTitle;
  String originSubTitle;
  String destinationTitle;
  String destinationSubTitle;
  String distance;
  String time;
  RideRequest request;
  CustomSearchingDriverSheet({
    super.key,
    required this.originTitle,
    required this.originSubTitle,
    required this.destinationTitle,
    required this.destinationSubTitle,
    required this.distance,
    required this.time,
    required this.request,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<MapsCubit, MapsState>(
      listener: (context, state) {
        final state = context.read<MapsCubit>().state;
        final cubit = context.read<MapsCubit>();

        if (state is GetActiveRideRequestSuccess) {
          Fluttertoast.showToast(
              msg: AppLocalizations.of(context)!.ride_is_accepted);
          Navigator.pop(context);
          Navigator.of(context).push(CupertinoPageRoute(
              builder: (_) => TripScreen(
                    activeRide: state.activeRide,
                  )));
        }

        if (state is GetActiveRideRequestNoTrips) {
          cubit.canelRideRequest(context: context);
          Fluttertoast.showToast(
              msg:
                  AppLocalizations.of(context)!.request_not_accepted_try_again);
        }
      },
      child: Padding(
        padding:
            EdgeInsets.only(right: 10.0.w, left: 10.w, top: 5.h, bottom: 15.h),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          CustomCountdowntimer(
            request: request,
            originTitle: originTitle,
            originSubTitle: originSubTitle,
            destinationTitle: destinationTitle,
            destinationSubTitle: destinationSubTitle,
            distance: distance,
            time: time,
          ),
          //  verticalSpace(20.h),
        ]),
      ),
    );
  }
}
