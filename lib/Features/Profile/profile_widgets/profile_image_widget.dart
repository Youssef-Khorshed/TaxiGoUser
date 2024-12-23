import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({
    super.key,
    this.imagePath,
  });
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.h,
      height: 80.h,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imagePath ??
                  'https://mrwallpaper.com/images/high/cool-profile-pictures-bart-xxxtentacion-qriuzlsntbbl9cv5.webp'))),
    );
  }
}
