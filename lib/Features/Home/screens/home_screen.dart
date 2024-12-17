import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import '../../../Core/Utils/Routing/app_routes.dart';
import '../../../Core/Utils/app_custom_widgets/custom_app_bottom.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
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
              bottom: 10,
              right: 15,
              left: 15,
              child: CustomAppBottom(
                iconColor: AppColors.blackColor,
                buttonColor: AppColors.whiteColor2,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.mapScreen);
                },
                buttonText: 'Where You Go ?',
                textColor: AppColors.blackColor,
                hasIcon: true,
                borderCornerRadius: 200,
              ),
            )
          ],
        ),
      ),
    );
  }
}
