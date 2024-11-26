import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';

class LocationMessage extends StatelessWidget {
  final double latitude;
  final double longitude;
  final double widthFactor;
  final double heightFactor;
  final String message;
  final bool isSentByUser;

  const LocationMessage({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.widthFactor,
    required this.heightFactor,
    required this.message,
    required this.isSentByUser,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(10),
        constraints:
            BoxConstraints(maxWidth: widthFactor, maxHeight: heightFactor),
        decoration: _messageBoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _buildMessageText(),
            verticalSpace(5),
            _buildMap(),
          ],
        ),
      ),
    );
  }

  BoxDecoration _messageBoxDecoration() {
    return const BoxDecoration(
      color: AppColors.blueColor,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(16),
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    );
  }

  Widget _buildMessageText() {
    return Expanded(
      flex: 2,
      child: AutoSizeText(
        message,
        maxLines: 1,
        style: AppTextStyles.style18BlackW500
            .copyWith(color: AppColors.whiteColor),
      ),
    );
  }

  Widget _buildMap() {
    return Expanded(
      flex: 10,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(latitude, longitude),
          zoom: 14,
        ),
        markers: _buildMarkers(),
        zoomControlsEnabled: false,
        scrollGesturesEnabled: false,
        rotateGesturesEnabled: false,
      ),
    );
  }

  Set<Marker> _buildMarkers() {
    return {
      Marker(
        markerId: const MarkerId("shared_location"),
        position: LatLng(latitude, longitude),
      ),
    };
  }
}
