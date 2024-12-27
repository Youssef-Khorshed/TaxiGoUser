import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/map_cubit/mapCubit.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/map_cubit/mapState.dart';
import 'package:taxi_go_user_version/Features/Map/Data/model/get_active_ride/get_active_ride.dart';
import 'package:taxi_go_user_version/Features/Map/map_widget/custom_snapping_sheet.dart';

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
          ],
        ),
      ),
    );
  }

  void handleMapCases(MapsState state, BuildContext context) async {
    if (state is GetActiveRideRequestSuccess) {
      final captin = state.activeRide.data!.ride!.first.captain!;
      final captinLatLng =
          LatLng(double.parse(captin.lat!), double.parse(captin.lng!));
      context.read<MapsCubit>().buildmarker(
          title: 'Car', destinationInfo: 'Car', postion: captinLatLng);

      /// check for going to customer
      if (state.activeRide.data!.ride!.first.status == 'to_customer' &&
          !context.read<MapsCubit>().arrivedtoCustomer) {
        Fluttertoast.showToast(msg: 'Captin on Way');
        context.read<MapsCubit>().arrivedToCustomer();
      }

      /// check if rider accept customer and start trip
      else if (state.activeRide.data!.ride!.first.status == 'on_trip' &&
          !context.read<MapsCubit>().onTrip) {
        Fluttertoast.showToast(msg: 'Trip Strated');
        context.read<MapsCubit>().startTrip();
        context.read<MapsCubit>().accept();
      }
    }

    /// check if the trip cancelled in Failure Case
    else if (state is GetActiveRideRequestFail) {
      await context.read<MapsCubit>().getLastRidetrip(context: context);

      /// check if the trip completed or Cancelled
      if (state is GetLastRideSuccess) {
        Fluttertoast.showToast(msg: 'Trip completed');
        Navigator.of(context).pushReplacementNamed(AppRoutes.payment);
      } else {
        Fluttertoast.showToast(msg: 'Trip Cancelled');
        Navigator.of(context).pushReplacementNamed(AppRoutes.generalScreen);
      }
    }
  }
}
