import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:taxi_go_user_version/Features/HiringDriver/screens/hiring_widgets/custom_buildrowdetail_hiring.dart';

class RateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.blueColor,
      appBar: AppBar(
        title: // Page Title
            const AutoSizeText(
          "Rate Your Trip",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.blueColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.03),

            // User Profile and Rating Section
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  height: size.height,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Profile Image and Name
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.1),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: size.height * 0.04,
                          ),
                          title: AutoSizeText("Ben Stokes",
                              style: AppTextStyles.style24BlackW500),
                          subtitle: AutoSizeText(
                            "⭐ 4.9",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: size.height * 0.014,
                            ),
                          ),
                        ),
                      ),
                      verticalSpace(size.height * 0.001),
                      // Rating Stars
                      AutoSizeText(
                        "How is your trip?",
                        style: AppTextStyles.style18BlackW600,
                      ),
                      verticalSpace(size.height * 0.001),
                      RatingBar.builder(
                        initialRating: 4,
                        minRating: 1,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemSize: size.height * 0.04,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                      verticalSpace(size.height * 0.01),
                      // Feedback Box
                      TextField(
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText: "Write your feedback",
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      verticalSpace(size.height * 0.01),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            'Trip Detail',
                            style: AppTextStyles.style16BlackW600,
                          ),
                          // Location section
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  const Icon(Icons.location_pin,
                                      color: Colors.red),
                                  Container(
                                    height: size.height * 0.06,
                                  ),
                                  const Icon(Icons.location_pin,
                                      color: Colors.blue),
                                ],
                              ),
                              verticalSpace(size.width * 0.01),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText(
                                      'Current location',
                                      style: AppTextStyles.style16DarkgrayW500,
                                    ),
                                    AutoSizeText(
                                      '2972 Westheimer Rd. Santa Ana, Illinois 85486',
                                      style: AppTextStyles.style14GrayW500,
                                    ),
                                    verticalSpace(size.height * 0.02),
                                    AutoSizeText(
                                      'Office',
                                      style: AppTextStyles.style16DarkgrayW500,
                                    ),
                                    Row(
                                      children: [
                                        AutoSizeText(
                                          '1901 Thornridge Cir. Shiloh, Hawaii 81063',
                                          style: AppTextStyles.style14GrayW500,
                                        ),
                                        const Spacer(),
                                        AutoSizeText(
                                          '1.1km',
                                          style: AppTextStyles.style14GrayW500,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          verticalSpace(size.height * 0.001),
                          AutoSizeText(
                            'Payment Detail',
                            style: AppTextStyles.style16BlackW600,
                          ),
                          verticalSpace(size.height * 0.001),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Buildrowdetail(label: 'Distance', value: '\$200'),
                              Buildrowdetail(label: 'Time', value: '\$20'),
                              Buildrowdetail(
                                  label: 'Promo Code', value: '\$20'),
                              Buildrowdetail(
                                label: 'Total',
                                value: '\$220',
                                isBold: true,
                              ),
                            ],
                          ),
                          verticalSpace(size.height * 0.002),
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
                                'Submit',
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
