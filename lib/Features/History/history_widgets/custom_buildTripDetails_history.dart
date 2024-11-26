import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Features/History/history_widgets/custom_driverDetails_history.dart';

class CustomBuildTripDetails extends StatelessWidget {
  const CustomBuildTripDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildTripDetails();
  }

  Widget _buildTripDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            color: AppColors.whiteColor2,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 8,
                          backgroundColor: AppColors.blueColor,
                        ),
                        CircleAvatar(
                          radius: 3,
                          backgroundColor: AppColors.whiteColor,
                        ),
                      ],
                    ),
                    Container(
                      width: 1,
                      height: 10,
                      color: Colors.grey,
                    ),
                    const Icon(Icons.location_pin, color: Colors.red),
                  ],
                ),
                horizontalSpace(5),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          AutoSizeText(
                            'State Park',
                            style: AppTextStyles.style18BlackW600,
                          ),
                          const Spacer(),
                          AutoSizeText(
                            '7:34 AM',
                            style: AppTextStyles.style16DarkgrayW500,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          AutoSizeText(
                            'Home',
                            style: AppTextStyles.style18BlackW600,
                          ),
                          const Spacer(),
                          AutoSizeText(
                            '7:48 AM',
                            style: AppTextStyles.style16DarkgrayW500,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )),
        Container(
          width: double.infinity,
          height: 1,
          color: AppColors.darkgrayColor,
        ),
        const CustomDriverdetailsHistory(),
      ],
    );
  }
}
