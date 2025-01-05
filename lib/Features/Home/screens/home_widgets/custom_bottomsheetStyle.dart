import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snapping_sheet/snapping_sheet.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/customSearchingDriverSheet.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_searchAgain.dart';

void customBottomSheet({
  required BuildContext context,
  required Widget widget,
  required String title,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => _SnappingBottomSheet(
      widget: widget,
      title: title,
    ),
  );
}

class _SnappingBottomSheet extends StatelessWidget {
  final Widget widget;
  final String title;

  const _SnappingBottomSheet({
    required this.widget,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.2,
      maxChildSize: 0.9,
      builder: (_, controller) => SnappingSheet(
        lockOverflowDrag: false,
        snappingPositions: [
          SnappingPosition.pixels(
            positionPixels: widget is CustomSearchingDriverSheet ||
                    widget is CustomSearchAgain
                ? 150
                : 400,
            snappingCurve: Curves.elasticOut,
            snappingDuration: const Duration(milliseconds: 1750),
          ),
          const SnappingPosition.factor(
            positionFactor: 0.0,
            snappingCurve: Curves.easeOutExpo,
            snappingDuration: Duration(seconds: 1),
            grabbingContentOffset: GrabbingContentOffset.top,
          ),
          SnappingPosition.factor(
            positionFactor: widget is CustomSearchingDriverSheet ||
                    widget is CustomSearchAgain
                ? 150
                : 400,
            snappingCurve: Curves.bounceOut,
            snappingDuration: const Duration(seconds: 1),
            grabbingContentOffset: GrabbingContentOffset.bottom,
          ),
        ],
        grabbingHeight: 110.h,
        grabbing: Container(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
          ),
          child: Center(
            child: Text(
              title,
              style: AppTextStyles.style18BlackBold,
            ),
          ),
        ),
        sheetBelow: SnappingSheetContent(
            draggable: true,
            child: SingleChildScrollView(
                child: Container(color: AppColors.whiteColor, child: widget))),
      ),
    );
  }
}

    // showModalBottomSheet(
    //   backgroundColor: AppColors.whiteColor,
    //   context: context,
    //   isScrollControlled: true,
    //   shape: const RoundedRectangleBorder(
    //     borderRadius: BorderRadius.only(
    //       topLeft: Radius.circular(16.0),
    //       topRight: Radius.circular(16.0),
    //     ),
    //   ),
    //   builder: (context) {
    //     return widget;
    //   },
    // );

