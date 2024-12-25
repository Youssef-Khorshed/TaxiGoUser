// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/Custom_changeAddress_buttons_sheet.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_BuildAdressRow.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_RideTypeSelector.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class CustomChangeaddressSheet extends StatefulWidget {
  String originTitle;
  String originSubTitle;
  String destinationTitle;
  String destinationSubTitle;
  String distance;
  String time;
  CustomChangeaddressSheet({
    super.key,
    required this.originTitle,
    required this.originSubTitle,
    required this.destinationTitle,
    required this.destinationSubTitle,
    required this.distance,
    required this.time,
  });

  @override
  State<CustomChangeaddressSheet> createState() =>
      _CustomChangeaddressSheetState();
}

class _CustomChangeaddressSheetState extends State<CustomChangeaddressSheet> {
  int _selectedtriptype = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AutoSizeText(
            AppLocalizations.of(context)!.change_address,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          verticalSpace(16.h),
          BuildAddressRow(
            title: widget.originTitle,
            traling: false,
            icon: const Icon(Icons.location_on, color: AppColors.redColor),
            subtitle: widget.originSubTitle,
          ),
          verticalSpace(12.h),
          BuildAddressRow(
            traling: true,
            title: widget.destinationTitle,
            icon: const Icon(Icons.location_on, color: AppColors.blueColor),
            subtitle: widget.destinationSubTitle,
            distance: widget.distance,
            time: widget.time,
          ),
          verticalSpace(16.h),
          CustomRidetypeselector(
            onRideTypeSelected: (index) {
              _selectedtriptype = index;
              setState(() {});
            },
          ),
          verticalSpace(20.h),
          Custom_changeAddress_buttons_sheet(
              originTitle: widget.originTitle,
              destinationTitle: widget.destinationTitle,
              distance: widget.distance,
              time: widget.time,
              widget: widget,
              selectedtriptype: _selectedtriptype)
        ],
      ),
    );
  }
}
