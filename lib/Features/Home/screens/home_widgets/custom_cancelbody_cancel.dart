import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Core/Utils/app_custom_widgets/custom_app_bottom.dart';
import 'package:taxi_go_user_version/Features/Home/controller/rate_%20cancel_cubit/rete_cancel_cubit.dart';

class CustomCancelBodyCancel extends StatefulWidget {
  final Function(String) onCancel;

  const CustomCancelBodyCancel({super.key, required this.onCancel});

  @override
  State<CustomCancelBodyCancel> createState() => _CustomCancelBodyCancelState();
}

class _CustomCancelBodyCancelState extends State<CustomCancelBodyCancel> {
  int _selectedReason = 1; // Default selected reason index

  void _sendCancellationReason(List<String> reasons, state) {
    final selectedReasonText = reasons[_selectedReason - 1];
    widget.onCancel(selectedReasonText);
    BlocProvider.of<RateCancelCubit>(context)
        .confirmCancel(context, selectedReasonText);
    if (state is CancelSuccess) {
      if (state.status == true) {
        // Navigator.pushReplacementNamed(context, AppRoutes.generalScreen);
        Fluttertoast.showToast(msg: "Success");
      } else if (state is CancelError) {
        Fluttertoast.showToast(msg: "CancelError");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final reasons = [
      AppLocalizations.of(context)!.i_dont_need_this_journey,
      AppLocalizations.of(context)!.i_want_to_change_details,
      AppLocalizations.of(context)!.driver_took_too_long,
      AppLocalizations.of(context)!.other,
    ];

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(size.width * 0.05.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.why_do_you_want_to_cancel,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: size.height * 0.022.sp,
                ),
              ),
              verticalSpace(size.height * 0.02),
              ...List.generate(
                reasons.length,
                (index) => _buildReasonOption(index + 1, reasons[index]),
              ),
              verticalSpace(20),
              CustomAppBottom(
                  buttonText: AppLocalizations.of(context)!.send,
                  borderCornerRadius: 8,
                  onPressed: () => _sendCancellationReason(reasons, context)),
            ],
          ),
        ),
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
        style: AppTextStyles.style16BlackW600,
      ),
    );
  }
}
