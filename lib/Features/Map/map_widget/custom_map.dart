import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/mapCubit.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/mapState.dart';

class CustomMap extends StatefulWidget {
  const CustomMap({super.key});

  @override
  State<CustomMap> createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap> {
  // late String mapStyle;
  @override
  void initState() {
    // initalStyle();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapsCubit, MapsState>(
      builder: (context, state) {
        return Stack(
          children: [
            buildMap(),
            // Positioned(
            //     top: 50,
            //     child: ElevatedButton(
            //       onPressed: () {
            //         // context.read<MapsCubit>().emitPlaceLocation(
            //         //     placeId: 'ChIJ8aukkz5NtokRLAHB24Ym9dc',
            //         //     sessionToken: 'sessionToken',
            //         //     context: context);
            //         // context
            //         //     .read<MapsCubit>()
            //         //     .getUserLocation(title: 'origin');
            //         // .emitPlaceSuggestions(
            //         //     searchQuery: 'alex',
            //         //     sessionToken: 'sessionToken',
            //         //     context: context);
            //       },
            //       child: Text('data'),
            //     ))
          ],
        );
      },
    );
  }

  GoogleMap buildMap() {
    return GoogleMap(
      markers: context.read<MapsCubit>().markers,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      // style: mapStyle, // to control theme (Dark/Light)
      onMapCreated: (controller) {
        context.read<MapsCubit>().mapController = controller;
        setState(() {});
      },
      initialCameraPosition: const CameraPosition(
          target: LatLng(33.40302561069593, 44.498105563683005), zoom: 8),
    );
  }

  // void initalStyle() async {
  //   mapStyle = await DefaultAssetBundle.of(context)
  //       .loadString("assets/mapstyle/night.json");
  // }

  @override
  void dispose() {
    context.read<MapsCubit>().mapController.dispose();
    super.dispose();
  }
}
