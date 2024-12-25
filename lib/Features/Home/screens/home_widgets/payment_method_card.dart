import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';

class PaymentMethodCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final bool isSelected;
  final Image image;
  final ValueChanged<bool> onSelected;

  const PaymentMethodCard({
    super.key,
    required this.title,
    required this.image,
    required this.subtitle,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  State<PaymentMethodCard> createState() => _PaymentMethodCardState();
}

class _PaymentMethodCardState extends State<PaymentMethodCard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        widget.onSelected(
            !widget.isSelected); // Notify the parent to change the selection
      },
      child: Container(
        width: size.width * 0.7.w,
        // margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
        padding: EdgeInsets.all(size.width * 0.03.w),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: Border.all(
            color: widget.isSelected ? Colors.blue : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            widget.image,
            horizontalSpace(20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(widget.title,
                    style: AppTextStyles.style14DarkgrayW500),
                if (widget.subtitle.isNotEmpty)
                  AutoSizeText(
                    widget.subtitle,
                    style: AppTextStyles.style12DarkgrayW400,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
