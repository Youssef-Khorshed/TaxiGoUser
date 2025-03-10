// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/Custom_changeAddress_buttons_sheet.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_BuildAdressRow.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_RideTypeSelector.dart';

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
      padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h, top: 0.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          verticalSpace(20.h),
          BuildAddressRow(
              fromAddress: widget.originSubTitle,
              fromLoccation: widget.originTitle,
              toAddress: widget.destinationSubTitle,
              //  distance: widget.distance,
              // time: widget.time,
              toLocation: widget.destinationTitle),
          verticalSpace(25.h),
          CustomRidetypeselector(
            onRideTypeSelected: (index) {
              _selectedtriptype = index;
              setState(() {});
            },
          ),
          verticalSpace(30.h),
          Custom_changeAddress_buttons_sheet(
              originTitle: widget.originTitle,
              destinationTitle: widget.destinationTitle,
              distance: widget.distance,
              time: widget.time,
              widget: widget,
              selectedtriptype: _selectedtriptype),
          verticalSpace(10.h),
        ],
      ),
    );
  }
}
