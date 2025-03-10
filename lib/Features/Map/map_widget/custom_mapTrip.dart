// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/map_cubit/mapCubit.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/map_cubit/mapState.dart';
import 'package:taxi_go_user_version/Features/Map/Data/model/get_active_ride/get_active_ride.dart';
import 'package:uuid/uuid.dart';

// ignore: must_be_immutable
class CustomMaptrip extends StatefulWidget {
  GetActiveRide nearbyRideRequest;

  CustomMaptrip({
    super.key,
    required this.nearbyRideRequest,
  });

  @override
  State<CustomMaptrip> createState() => _CustomMaptripState();
}

class _CustomMaptripState extends State<CustomMaptrip> {
  Timer? _timer;
  String? mapStyle;
  StreamSubscription<void>? _subscription;

  @override
  void initState() {
    _startStream();
    super.initState();
  }

  void _startStream() {
    _subscription = Stream.periodic(const Duration(seconds: 2), (_) {
      return context.read<MapsCubit>().getRideRequestStream(context: context);
    }).asyncExpand((stream) => stream).listen((data) {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapsCubit, MapsState>(
      builder: (context, state) {
        return Stack(
          children: [
            buildMap(),
          ],
        );
      },
    );
  }

  GoogleMap buildMap() {
    return GoogleMap(
      padding: EdgeInsets.only(bottom: 50.w, left: 100.h),
      markers: context.watch<MapsCubit>().markers,
      polylines: context.watch<MapsCubit>().polyLines,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      //style: mapStyle, // to control theme (Dark/Light)
      onMapCreated: (controller) {
        final cubit = context.read<MapsCubit>();
        cubit.mapController = controller;
        final source = LatLng(
            double.parse(widget.nearbyRideRequest.data!.latFrom!),
            double.parse(widget.nearbyRideRequest.data!.lngFrom!));
        final des = LatLng(double.parse(widget.nearbyRideRequest.data!.latTo!),
            double.parse(widget.nearbyRideRequest.data!.lngTo!));
        cubit.emitPlaceDirections(
            origin: source,
            destination: des,
            sessionToken: const Uuid().v4(),
            context: context);
      },

      initialCameraPosition: const CameraPosition(
          target: LatLng(33.40302561069593, 44.498105563683005), zoom: 8),
    );
  }

  void initalStyle() async {
    mapStyle = await DefaultAssetBundle.of(context)
        .loadString("assets/mapstyle/night.json");
  }

  @override
  void deactivate() {
    _subscription?.cancel();
    super.deactivate();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
