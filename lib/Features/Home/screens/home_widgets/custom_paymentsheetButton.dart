// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/map_string_maipulation.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/app_custom_widgets/custom_app_bottom.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/customSearchingDriverSheet.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_PaymentMethodSelector.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_bottomsheetStyle.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/map_cubit/mapCubit.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/map_cubit/mapState.dart';

// ignore: must_be_immutable
class PaymentButton extends StatelessWidget {
  String originTitle;
  String originSubTitle;
  String destinationTitle;
  String destinationSubTitle;
  String distance;
  String time;
  PaymentButton({
    super.key,
    required this.originTitle,
    required this.originSubTitle,
    required this.destinationTitle,
    required this.destinationSubTitle,
    required this.distance,
    required this.time,
    required this.controller,
    required this.widget,
    required this.selectedMethod,
  });

  final TextEditingController controller;
  final PaymentMethodSelector widget;
  final String selectedMethod;

  @override
  Widget build(BuildContext context) {
    return BlocListener<MapsCubit, MapsState>(
      listener: (context, state) {
        if (state is RideRequestSuccess) {
          Navigator.pop(context);
          customBottomSheet(
              context: context,
              widget: CustomSearchingDriverSheet(
                request: state.request,
                originTitle: originTitle,
                originSubTitle: originSubTitle,
                destinationTitle: destinationTitle,
                destinationSubTitle: destinationSubTitle,
                distance: distance,
                time: time,
              ));
        }
      },
      child: Row(
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
    );
  }
}
