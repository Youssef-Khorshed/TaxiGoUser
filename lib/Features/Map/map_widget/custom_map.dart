// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:taxi_go_user_version/Features/Map/Controller/map_cubit/mapCubit.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/map_cubit/mapState.dart';

// ignore: must_be_immutable
class CustomMap extends StatefulWidget {
  const CustomMap({
    super.key,
  });

  @override
  State<CustomMap> createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap> {
  String? mapStyle;
  @override
  void initState() {
    initalStyle();

    super.initState();
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
      markers: context.read<MapsCubit>().markers,
      polylines: context.read<MapsCubit>().polyLines,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      // style: mapStyle, // to control theme (Dark/Light)
      onMapCreated: (controller) {

       MapsCubit.get(context).mapControllerInit(controller);
        setState(() {});
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
  void dispose() {
    super.dispose();
  }
}
