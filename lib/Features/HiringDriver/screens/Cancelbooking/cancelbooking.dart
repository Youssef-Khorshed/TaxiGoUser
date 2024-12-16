import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_go_user_version/Core/Utils/Assets/icons/app_icons.dart';
import 'package:taxi_go_user_version/Core/Utils/Assets/images/app_images.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Features/HiringDriver/screens/Cancelbooking/cnacelBooking_widget/custom_cancelbody_cancel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CancelBookingScreen extends StatefulWidget {
  const CancelBookingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CancelBookingScreenState createState() => _CancelBookingScreenState();
}

class _CancelBookingScreenState extends State<CancelBookingScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.blueColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(AppRoutes.generalScreen),
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.whiteColor,
            )),
        backgroundColor: AppColors.blueColor,
        title: Text(
          AppLocalizations.of(context)!.cancel_booking,
          style: AppTextStyles.style20WhiteW600,
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          CircleAvatar(
            radius: 50.r,
            backgroundImage: AssetImage(AppIcons.appIcon),
          ),
          const Spacer(),
          const CustomCancelbodyCancel()
        ],
      ),
    );
  }
}
