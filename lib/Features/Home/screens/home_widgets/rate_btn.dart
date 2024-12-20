import 'package:flutter/material.dart';

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
    Key? key,
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
  }) : super(key: key);

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
      onPressed: () => _handleButtonPress(context),
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
