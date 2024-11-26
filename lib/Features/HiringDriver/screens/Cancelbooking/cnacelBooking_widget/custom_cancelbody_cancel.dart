import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Features/HiringDriver/screens/hiring_widgets/custom_button_hiring.dart';

class CustomCancelbodyCancel extends StatefulWidget {
  const CustomCancelbodyCancel({super.key});

  @override
  State<CustomCancelbodyCancel> createState() => _CustomCancelbodyCancelState();
}

class _CustomCancelbodyCancelState extends State<CustomCancelbodyCancel> {
  int _selectedReason = 1; // Default selected reason index

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // Reason Selection Container
        Container(
          width: double.infinity,
          height: size.height * 0.6,
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
              verticalSpace(20),
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
        style: AppTextStyles.style24DarkgrayW500,
      ),
    );
  }
}
