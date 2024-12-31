import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_go_user_version/Features/Home/controller/rate_%20cancel_cubit/rete_cancel_cubit.dart';

class RateButton extends StatelessWidget {
  final VoidCallback onValidRateWithFeedback;
  final VoidCallback onValidRateWithoutFeedback;
  final VoidCallback onInvalidRateWithFeedback;
  final VoidCallback onInvalidRateWithoutFeedback;
  final String buttonText;
  final TextEditingController feedbackController;
  final double rate;
  final Color backgroundColor;
  final TextStyle textStyle;
  final EdgeInsets padding;

  const RateButton({
    super.key,
    required this.onValidRateWithFeedback,
    required this.onValidRateWithoutFeedback,
    required this.onInvalidRateWithFeedback,
    required this.onInvalidRateWithoutFeedback,
    required this.buttonText,
    required this.feedbackController,
    required this.rate,
    required this.backgroundColor,
    required this.textStyle,
    required this.padding,
  });

  void _handleButtonPress(BuildContext context) {
    if (feedbackController.text.isNotEmpty && rate <= 1) {
      onInvalidRateWithFeedback();
    } else if (feedbackController.text.isEmpty && rate <= 1) {
      onInvalidRateWithoutFeedback();
    } else if (feedbackController.text.isNotEmpty && rate >= 1) {
      onValidRateWithFeedback();
    } else if (feedbackController.text.isEmpty && rate >= 1) {
      onValidRateWithoutFeedback();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _handleButtonPress(context);
        BlocProvider.of<RateCancelCubit>(context).feedBackController.clear();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        buttonText,
        style: textStyle,
      ),
    );
  }
}
