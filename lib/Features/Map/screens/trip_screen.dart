import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:taxi_go_user_version/Core/Utils/Assets/images/app_images.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/convertTime_Distance/custom_covertMethods.dart';
import 'package:taxi_go_user_version/Features/Home/screens/payment.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/map_cubit/mapCubit.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/map_cubit/mapState.dart';
import 'package:taxi_go_user_version/Features/Map/Data/model/get_active_ride/get_active_ride.dart';
import 'package:taxi_go_user_version/Features/Map/map_widget/custom_snapping_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class TripScreen extends StatefulWidget {
  GetActiveRide activeRide;

  TripScreen({
    super.key,
    required this.activeRide,
  });

  @override
  State<TripScreen> createState() => TripScreenState();
}

class TripScreenState extends State<TripScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MapsCubit, MapsState>(
      listener: (context, state) {
        handleMapCases(state, context);
      },
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        body: Stack(
          children: [
            CustomSnappingSheet(
              nearbyRideRequest: widget.activeRide,
              isAccepted: true,
            ),
            context.watch<MapsCubit>().onTrip
                ? Positioned(
                    top: MediaQuery.of(context).size.height / 8,
                    right: 20,
                    left: 20,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.blueColor),
                          borderRadius: BorderRadius.circular(10.r),
                          color: AppColors.whiteColor),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.timer_outlined,
                                color: AppColors.blueColor,
                              ),
                              horizontalSpace(10.w),
                              Text(convertToTimeString(
                                  context
                                      .read<MapsCubit>()
                                      .distanceTime
                                      .duration!
                                      .text!,
                                  AppLocalizations.of(context)!.hours,
                                  AppLocalizations.of(context)!.mins)),
                              horizontalSpace(20.w),
                              Container(
                                width: 2,
                                color: AppColors.blueColor.withAlpha(100),
                                height: 50.h,
                              ),
                            ],
                          ),
                          horizontalSpace(20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppImages.userLocationImage,
                                width: 20.w,
                                height: 20.h,
                              ),
                              horizontalSpace(10),
                              Text(
                                convertMetersToKilometers(
                                    context
                                        .read<MapsCubit>()
                                        .distanceTime
                                        .distance!
                                        .value!
                                        .toDouble(),
                                    AppLocalizations.of(context)!.km,
                                    AppLocalizations.of(context)!.meter),

                                // convertMilesToKilometerString(
                                //   context
                                //   .read<MapsCubit>()
                                //   .distanceTime
                                //   .distance!
                                //   .value!
                                //   .toDouble()
                                //   )
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  void handleMapCases(MapsState state, BuildContext context) async {
    final mapcubit = context.read<MapsCubit>();

    /// check if the trip completed or Cancelled
    if (state is GetLastRideSuccess) {
      Fluttertoast.showToast(
          msg: 'Trip completed ${state.getLastRideSuccess.data!.id}');
      Fluttertoast.showToast(
          msg: 'Trip completed ${state.getLastRideSuccess.data!.id}');
      mapcubit.arrivedtoCustomer = false;
      mapcubit.onTrip = false;
      mapcubit.isAccepted = false;
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const PaymentScreen()));
    } else if (state is GetActiveRideRequestSuccess) {
      final captin = state.activeRide.data!.ride!.first.captain!;

      final captinLatLng =
          LatLng(double.parse(captin.lat!), double.parse(captin.lng!));
      final captinMarker = await BitmapDescriptor.asset(
          const ImageConfiguration(), AppImages.captinLocationImage);

      mapcubit.buildmarker(
          customicon: captinMarker,
          title: 'Car',
          destinationInfo: 'Car',
          postion: captinLatLng);

      /// check for going to customer
      if (state.activeRide.data!.ride!.first.status == 'to_customer' &&
          !mapcubit.arrivedtoCustomer) {
        Fluttertoast.showToast(msg: 'Captin on Way');
        mapcubit.arrivedToCustomer();
      }

      /// check if rider accept customer and start trip
      else if (state.activeRide.data!.ride!.first.status == 'on_trip' &&
          !mapcubit.onTrip) {
        Fluttertoast.showToast(msg: 'Trip Strated');
        mapcubit.startTrip();
        mapcubit.accept();
      }
    }

    /// check if the trip cancelled in Failure Case
    else if (state is GetActiveRideRequestFail) {
      await mapcubit.getLastRidetrip(context: context);

      // Fluttertoast.showToast(msg: 'Trip Cancelled');
      mapcubit.arrivedtoCustomer = false;
      mapcubit.onTrip = false;
      mapcubit.isAccepted = false;
      Navigator.of(context).pushReplacementNamed(AppRoutes.generalScreen);
    }
  }
}
