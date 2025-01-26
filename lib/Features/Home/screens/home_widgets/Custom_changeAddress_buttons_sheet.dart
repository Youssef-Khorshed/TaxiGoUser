// ignore_for_file: public_member_api_docs, sort_constructors_first

// ignore: camel_case_types, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/app_custom_widgets/custom_app_bottom.dart';
import 'package:taxi_go_user_version/Core/Utils/convertTime_Distance/custom_covertMethods.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_PaymentMethodSelector.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_bottomsheetStyle2.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_changeAddress_sheet.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/map_cubit/mapCubit.dart';

// ignore: must_be_immutable, camel_case_types
class Custom_changeAddress_buttons_sheet extends StatefulWidget {
  String originTitle;
  String destinationTitle;
  String distance;
  String time;
  Custom_changeAddress_buttons_sheet({
    super.key,
    required int selectedtriptype,
    required this.originTitle,
    required this.destinationTitle,
    required this.distance,
    required this.time,
    required this.widget,
  }) : _selectedtriptype = selectedtriptype;

  final CustomChangeaddressSheet widget;
  final int _selectedtriptype;

  @override
  State<Custom_changeAddress_buttons_sheet> createState() =>
      _Custom_changeAddress_buttons_sheetState();
}

// ignore: camel_case_types
class _Custom_changeAddress_buttons_sheetState
    extends State<Custom_changeAddress_buttons_sheet> {
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
            buttonText: AppLocalizations.of(context)!.go,
            textColor: Colors.white,
            onPressed: () async {
              final cubit = context.read<MapsCubit>();
              await cubit.calculatePrice(
                  context: context,
                  time: convertToMinutes(widget.widget.time),
                  distance: widget.widget.distance,
                  triptype: widget._selectedtriptype + 1,
                  origin: LatLng(
                      cubit.orginPosition!.lat!, cubit.orginPosition!.lng!),
                  destination: LatLng(cubit.destinationostion!.lat!,
                      cubit.destinationostion!.lng!));
              Navigator.pop(context);
              customBottomSheet2(
                  context: context,
                  title: AppLocalizations.of(context)!.tripDetails,
                  widget: PaymentMethodSelector(
                    originTitle: widget.widget.originTitle,
                    destinationTitle: widget.widget.destinationTitle,
                    distance: widget.widget.distance,
                    time: convertToMinutes(widget.widget.time).toString(),
                    addressFrom: widget.widget.originSubTitle,
                    addressTo: widget.widget.destinationSubTitle,
                    tripType: widget._selectedtriptype + 1,
                  ));
            },
          ),
        ),
        horizontalSpace(10.w),
        Expanded(
          child: CustomAppBottom(
            buttonColor: AppColors.redColor.withOpacity(0.03),
            borderColor: AppColors.redLight,
            borderCornerRadius: 40.r,
            buttonText: AppLocalizations.of(context)!.cancel_k,
            textColor: AppColors.redColor,
            onPressed: () {
              if (mounted) {
                context.read<MapsCubit>().clearMarkerPolyines();
                Navigator.of(context)
                    .pushReplacementNamed(AppRoutes.generalScreen);
              }
            },
          ),
        )
      ],
    );
  }
}

/**
 * 
 *    Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: CustomAppBottom(
              buttonColor: AppColors.blueColor,
              borderColor: Colors.white,
              borderCornerRadius: 40.r,
              buttonText: AppLocalizations.of(context)!.go,
              textColor: Colors.white,
              onPressed: () async {
                final cubit = context.read<MapsCubit>();
                await cubit.riderequest(
                  context: context,
                  promocode: controller.text,
                  addressFrom: MapStringMaipulation.concatenateLongNames(
                      cubit.originAddress.addressComponents),
                  addressTo: MapStringMaipulation.concatenateLongNames(
                      cubit.destinationAddress.addressComponents),
                  latFrom: cubit.orginPosition!.lat!.toString(),
                  lngFrom: cubit.orginPosition!.lng!.toString(),
                  latTo: cubit.destinationostion!.lat!.toString(),
                  lngTo: cubit.destinationostion!.lng!.toString(),
                  tripType: widget.tripType,
                  paymentMethod: selectedMethod,
                );
              },
            ),
          ),
          horizontalSpace(15.h),
          Expanded(
            child: CustomAppBottom(
              buttonColor: AppColors.whiteColor,
              borderColor: AppColors.redColor,
              borderCornerRadius: 40.r,
              buttonText: AppLocalizations.of(context)!.cancel_k,
              textColor: AppColors.redColor,
              onPressed: () {
                context.read<MapsCubit>().clearMarkerPolyines();
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
   
 */