import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import '../../../Core/Utils/Routing/app_routes.dart';
import '../../../Core/Utils/app_custom_widgets/custom_app_bottom.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 10.h),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: GoogleMap(
                  padding: EdgeInsets.only(bottom: 40.h, left: 100.w),
                  myLocationButtonEnabled: false,
                  initialCameraPosition: const CameraPosition(
                      target: LatLng(33.40302561069593, 44.498105563683005),
                      zoom: 7.5),
                )),
            Positioned(
              bottom: 10.h,
              right: 15.w,
              left: 15.w,
              child: CustomAppBottom(
                iconColor: AppColors.blackColor,
                buttonColor: AppColors.whiteColor2,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.mapScreen);
                },
                buttonText: AppLocalizations.of(context)!.where_are_you_going,
                textColor: AppColors.blackColor,
                borderCornerRadius: 200.r,
              ),
            )
          ],
        ),
      ),
    );
  }
}
