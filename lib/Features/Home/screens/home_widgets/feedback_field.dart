import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeedbackField extends StatefulWidget {
  const FeedbackField({
    super.key,
    required this.feedBackController,
  });
  final TextEditingController feedBackController;
  @override
  State<FeedbackField> createState() => _FeedbackFieldState();
}

class _FeedbackFieldState extends State<FeedbackField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 3,
      controller: widget.feedBackController,
      decoration: InputDecoration(
        hintText: AppLocalizations.of(context)!.write_your_feedback,
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
