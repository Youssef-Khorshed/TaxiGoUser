import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_EnableDilaog.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/map_cubit/mapCubit.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/map_cubit/mapState.dart';
import 'package:taxi_go_user_version/Features/Map/map_widget/custom_map.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  void initState() {
    _initializeMapRenderer();
    super.initState();
  }

  void _initializeMapRenderer() {
    final GoogleMapsFlutterPlatform mapsImplementation =
        GoogleMapsFlutterPlatform.instance;
    if (mapsImplementation is GoogleMapsFlutterAndroid) {
      mapsImplementation.useAndroidViewSurface = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapsCubit, MapsState>(
      builder: (context, state) {
        return Scaffold(
            body: ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Stack(children: [
                  const CustomMap(),
                  Positioned(
                    top: 60.h,
                    right: 15.w,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                      child: IconButton(
                        onPressed: () {
                          context.read<MapsCubit>().clearMarkerPolyines();
                          Navigator.pushNamed(context, AppRoutes.generalScreen);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.blueColor,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 30.h,
                    right: 15.w,
                    left: 15.w,
                    child: SizedBox(
                      height: 54.h,
                      child: const CustomEnableDilaog(),
                    ),
                  ),
                ])));
      },
    );
  }
}
