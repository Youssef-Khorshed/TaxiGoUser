import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:taxi_go_user_version/Features/HiringDriver/screens/hiring_widgets/custom_buildrowdetail_hiring.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/location_details.dart';

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
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ))),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      verticalSpace(10.h),
                      // Rating Stars
                      AutoSizeText(
                        AppLocalizations.of(context)!.how_is_your_trip,
                        style: AppTextStyles.style18BlackW600,
                      ),
                      verticalSpace(5.h),
                      RatingBar.builder(
                        initialRating: 4,
                        minRating: 1,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemSize: size.height * 0.04,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0.h),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star_rounded,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                      verticalSpace(10.h),
                      // Feedback Box
                      AutoSizeText(
                        '${AppLocalizations.of(context)!.write_your_feedback} :',
                        style: AppTextStyles.style16BlackW600,
                      ),
                      TextField(
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText:
                              AppLocalizations.of(context)!.write_your_feedback,
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      verticalSpace(10.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Location section
                          SizedBox(child: LocationDetails()),

                          verticalSpace(size.height * 0.005),
                          AutoSizeText(
                            AppLocalizations.of(context)!.payment_details,
                            style: AppTextStyles.style16BlackW600,
                          ),
                          verticalSpace(size.height * 0.005),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Buildrowdetail(
                                  label: AppLocalizations.of(context)!.distance,
                                  value: '\$200'),
                              Buildrowdetail(
                                  label: AppLocalizations.of(context)!.time,
                                  value: '\$20'),
                              Buildrowdetail(
                                  label:
                                      AppLocalizations.of(context)!.promo_code,
                                  value: '\$20'),
                              Buildrowdetail(
                                label: AppLocalizations.of(context)!.total,
                                value: '\$220',
                                isBold: true,
                              ),
                            ],
                          ),
                          verticalSpace(15.h),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.blueColor,
                                padding: EdgeInsets.symmetric(
                                    vertical: size.height * 0.01),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: AutoSizeText(
                                AppLocalizations.of(context)!.submit,
                                style: AppTextStyles.style16WhiteW500,
                              ),
                            ),
                          ),
                        ],
                      ),
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
