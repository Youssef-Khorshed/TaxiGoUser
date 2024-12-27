// الصفحة الرئيسية: CancelBookingScreen
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taxi_go_user_version/Core/Utils/Assets/images/app_images.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_cancelbody_cancel.dart';

class CancelBookingScreen extends StatefulWidget {
  const CancelBookingScreen({super.key});

  @override
  State<CancelBookingScreen> createState() => _CancelBookingScreenState();
}

class _CancelBookingScreenState extends State<CancelBookingScreen> {
  void _handleCancellation(String selectedReason) {
    print("Cancellation Reason: $selectedReason");
    Fluttertoast.showToast(msg: AppLocalizations.of(context)!.canceled);

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushNamed(AppRoutes.generalScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.blueColor,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(AppRoutes.generalScreen),
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.whiteColor,
            ),
          ),
          backgroundColor: AppColors.blueColor,
          title: Text(
            AppLocalizations.of(context)!.cancel_booking,
            style: AppTextStyles.style20WhiteW600,
          ),
          elevation: 0,
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Center(
                child: CircleAvatar(
                  radius: 100.r,
                  backgroundImage: const AssetImage(AppImages.appImage),
                ),
              ),
            ),
            Expanded(
              child: CustomCancelBodyCancel(onCancel: _handleCancellation),
            ),
          ],
        ));
  }
}
