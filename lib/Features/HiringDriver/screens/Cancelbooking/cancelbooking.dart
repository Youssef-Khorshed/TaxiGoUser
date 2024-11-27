import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Features/HiringDriver/screens/Cancelbooking/cnacelBooking_widget/custom_cancelbody_cancel.dart';

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
          "Cancel Booking",
          style: AppTextStyles.style20WhiteW600,
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          verticalSpace(size.height * 0.1),
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                width: size.width * 0.3,
                height: size.height * 0.3,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
              const Positioned(
                top: 60,
                right: 10,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.red,
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          const CustomCancelbodyCancel()
        ],
      ),
    );
  }
}
