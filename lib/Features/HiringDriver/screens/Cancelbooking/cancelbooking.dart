import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Features/HiringDriver/screens/hiring_widgets/custom_button_hiring.dart';

class CancelBookingScreen extends StatefulWidget {
  const CancelBookingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CancelBookingScreenState createState() => _CancelBookingScreenState();
}

class _CancelBookingScreenState extends State<CancelBookingScreen> {
  int _selectedReason = 1; // Default selected reason index

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.blueColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(AppRoutes.generalScreen),
            icon: const Icon(Icons.arrow_back)),
        backgroundColor: AppColors.blueColor,
        title: Text(
          "Cancel Booking",
          style: AppTextStyles.style20WhiteW600,
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(size.width * 0.2),
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  width: size.width * 0.45,
                  height: size.width * 0.45,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                CircleAvatar(
                  radius: size.width * 0.06,
                  backgroundColor: Colors.red,
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: size.width * 0.06,
                  ),
                ),
              ],
            ),
            verticalSpace(size.height * 0.1),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                // Reason Selection Container
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(size.width * 0.05),
                  // margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Section Title
                      Text(
                        "Why do you want to cancel?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: size.height * 0.022,
                        ),
                      ),
                      verticalSpace(size.height * 0.01),

                      // Radio Buttons for Reasons
                      _buildReasonOption(1, "I don't need this journey."),
                      _buildReasonOption(
                          2, "I want to change the details of the journey."),
                      _buildReasonOption(
                          3, "The driver took too long to be appointed."),
                      _buildReasonOption(4, "Other"),
                      verticalSpace(5),
                      AppButton(
                        text: 'Send',
                        height: size.height * 0.01,
                        circlesize: 24,
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
                // Submit Button
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildReasonOption(int index, String title) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Radio<int>(
        value: index,
        groupValue: _selectedReason,
        activeColor: AppColors.blueColor,
        onChanged: (value) {
          setState(() {
            _selectedReason = value!;
          });
        },
      ),
      title: AutoSizeText(
        title,
        style: AppTextStyles.style16DarkgrayW500,
      ),
    );
  }
}
