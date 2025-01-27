import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/rate_details_block_builder.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/rate_tripe_widget.dart';

class RateScreen extends StatelessWidget {
  const RateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.blueColor,
      appBar: AppBar(
        title: // Page Title
            AutoSizeText(
          AppLocalizations.of(context)!.rate_your_trip,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.blueColor,
        automaticallyImplyLeading: false,
        // leading: IconButton(
        //     onPressed: () => Navigator.pop(context),
        //     icon: const Icon(
        //       Icons.arrow_back,
        //       color: Colors.white,

        //     ))
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpace(10.h),
            // User Profile and Rating Section
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  height: size.height,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: ListView(
                    children: [
                      verticalSpace(10.h),
                      // Rating Stars
                      RateTripeWidget(size: size),

                      verticalSpace(10.h),
                      RateDetailsBlockBuilder(size: size),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
