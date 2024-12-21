import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxi_go_user_version/Core/Utils/Assets/images/app_images.dart';

class CustomEmptyDataView extends StatelessWidget {
  const CustomEmptyDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        AppImages.emptyData,
        height: 150,
      ),
    );
  }
}
