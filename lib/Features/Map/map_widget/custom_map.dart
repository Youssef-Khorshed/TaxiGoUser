import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMap extends StatefulWidget {
  const CustomMap({super.key});

  @override
  State<CustomMap> createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap> {
  late GoogleMapController mapcontroller;
  late String mapStyle;
  @override
  void initState() {
    // initalStyle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildMap();
  }

  GoogleMap buildMap() {
    return GoogleMap(
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      style: mapStyle, // to control theme (Dark/Light)
      onMapCreated: (controller) {
        mapcontroller = controller;
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
    mapcontroller.dispose();
    super.dispose();
  }
}
