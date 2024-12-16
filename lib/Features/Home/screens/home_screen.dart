import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import '../../../Core/Utils/Routing/app_routes.dart';
import '../../../Core/Utils/app_custom_widgets/custom_app_bottom.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 10.h),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const GoogleMap(
                  initialCameraPosition: CameraPosition(
                      target: LatLng(37.42796133580664, -122.085749655962),
                      zoom: 14),
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
                hasIcon: true,
                borderCornerRadius: 200.r,
              ),
            )
          ],
        ),
      ),
    );
  }
}
