import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
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
        if (state is GetActiveRideRequestSuccess) {
          final captin = state.activeRide.data!.ride!.first.captain!;
          // final tripDetails = state.activeRide.data!;

          final captinLatLng =
              LatLng(double.parse(captin.lat!), double.parse(captin.lng!));
          // final originLatLng = LatLng(double.parse(tripDetails.latFrom!),

          //     double.parse(tripDetails.lngFrom!));

          context.read<MapsCubit>().buildmarker(
              title: 'Car', destinationInfo: 'Car', postion: captinLatLng);
          if (state.activeRide.data!.ride!.first.status == 'to_customer' &&
              !context.read<MapsCubit>().arrivedtoCustomer) {
            Fluttertoast.showToast(msg: 'Captin on Way');
            context.read<MapsCubit>().arrivedToCustomer();
          } else if (state.activeRide.data!.ride!.first.status == 'on_trip' &&
              !context.read<MapsCubit>().onTrip) {
            Fluttertoast.showToast(msg: 'Trip Strated');
            context.read<MapsCubit>().startTrip();
          } else if (state.activeRide.data!.status == 'cancelled') {
          } else if (state.activeRide.data!.status == 'completed') {}
        }
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

  double calculateDistance(LatLng point1, LatLng point2) {
    const double radius = 6371;

    double lat1 = point1.latitude * pi / 180;
    double lng1 = point1.longitude * pi / 180;
    double lat2 = point2.latitude * pi / 180;
    double lng2 = point2.longitude * pi / 180;

    double dlat = lat2 - lat1;
    double dlng = lng2 - lng1;

    double a = sin(dlat / 2) * sin(dlat / 2) +
        cos(lat1) * cos(lat2) * sin(dlng / 2) * sin(dlng / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    double distance = radius * c;

    return distance;
  }
}
