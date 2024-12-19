import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/app_custom_widgets/custom_app_bottom.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_PaymentMethodSelector.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_bottomsheetStyle.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_changeAddress_sheet.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/mapCubit.dart';

// ignore: camel_case_types
class Custom_changeAddress_buttons_sheet extends StatelessWidget {
  const Custom_changeAddress_buttons_sheet({
    super.key,
    required this.widget,
    required int selectedtriptype,
  }) : _selectedtriptype = selectedtriptype;

  final CustomChangeaddressSheet widget;
  final int _selectedtriptype;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CustomAppBottom(
            buttonColor: AppColors.blueColor,
            borderColor: Colors.white,
            borderCornerRadius: 40.r,
            buttonText: "Done",
            textColor: Colors.white,
            onPressed: () async {
              final cubit = context.read<MapsCubit>();
              await cubit.calculatePrice(
                  context: context,
                  time: convertToMinutes(widget.time),
                  distance: widget.distance,
                  triptype: _selectedtriptype + 1,
                  origin: LatLng(
                      cubit.orginPosition!.lat!, cubit.orginPosition!.lng!),
                  destination: LatLng(cubit.destinationostion.lat!,
                      cubit.destinationostion.lng!));
              //  Navigator.pop(context);
              customBottomSheet(
                  context: context,
                  widget: PaymentMethodSelector(
                    addressFrom: widget.originSubTitle,
                    addressTo: widget.destinationSubTitle,
                    tripType: _selectedtriptype + 1,
                  ));
            },
          ),
        ),
        Expanded(
          child: CustomAppBottom(
            buttonColor: AppColors.whiteColor,
            borderColor: AppColors.redColor,
            borderCornerRadius: 40.r,
            buttonText: "Cancel",
            textColor: AppColors.redColor,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        )
      ],
    );
  }
}
