import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/map_cubit/mapCubit.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/map_cubit/mapState.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/snapping_sheet_cubit/snapping_sheet_cubit.dart';
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
    //  Constants.subscription?.cancel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MapsCubit, MapsState>(
      listener: (context, state) {
        if (state is UpdateOriginLocatoin) {
          // context.read<MapsCubit>().getUserUpdatedLocation(
          //     context: context,
          //     location: LatLng(
          //         state.locationPosition.lat!, state.locationPosition.lng!));
        }
        if (state is UpdateCaptinLocatoin) {
          // final userlocation = context.read<MapsCubit>().orginPosition;
          // final captinlocation = LocationPosition(
          //     lat: state.updateCaptinLocation.data!.lat, //31.22136,29.93796
          //     lng: state.updateCaptinLocation.data!.lng);
          // final distance = calculateDistance(
          //     LatLng(userlocation!.lat!, userlocation.lng!),
          //     LatLng(captinlocation.lat!, captinlocation.lng!));
          // if (distance <= 0.2) {
          //   Fluttertoast.showToast(
          //       msg: 'Driver Arrived Successfully $distance');
          // }
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        body: BlocProvider(
          create: (context) => SnappingSheetCubit(),
          child: Stack(
            children: [
              CustomSnappingSheet(
                nearbyRideRequest: widget.activeRide,
                isAccepted: true,
              ),
            ],
          ),
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
