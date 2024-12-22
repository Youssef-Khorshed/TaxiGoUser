// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/app_custom_widgets/custom_app_bottom.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/customSearchingDriverSheet.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_PaymentMethodSelector.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_bottomsheetStyle.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/mapCubit.dart';

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CustomAppBottom(
            buttonColor: AppColors.blueColor,
            borderColor: Colors.white,
            borderCornerRadius: 40.r,
            buttonText: AppLocalizations.of(context)!.done,
            textColor: Colors.white,
            onPressed: () async {
              await context.read<MapsCubit>().riderequest(
                    context: context,
                    promocode: controller.text,
                    addressFrom: widget.addressFrom,
                    latFrom: "29.86093415790205",
                    // context
                    //     .read<MapsCubit>()
                    //     .orginPosition!
                    //     .lat!
                    //     .toString(),
                    lngFrom: "31.337443790067766",
                    // context
                    //     .read<MapsCubit>()
                    //     .orginPosition!
                    //     .lat!
                    //     .toString(),
                    addressTo: widget.addressTo,
                    latTo: "29.857100656110628",
                    // context
                    //     .read<MapsCubit>()
                    //     .orginPosition!
                    //     .lat!
                    //     .toString(),
                    lngTo: "31.307918035027203",
                    // context
                    //     .read<MapsCubit>()
                    //     .orginPosition!
                    //     .lat!
                    //     .toString(),
                    tripType: widget.tripType,
                    paymentMethod: selectedMethod,
                  );

              customBottomSheet(
                  context: context,
                  widget: CustomSearchingDriverSheet(
                    originTitle: originTitle,
                    originSubTitle: originSubTitle,
                    destinationTitle: destinationTitle,
                    destinationSubTitle: destinationSubTitle,
                    distance: distance,
                    time: time,
                  ));
            },
          ),
        ),
        verticalSpace(10.h),
        Expanded(
          child: CustomAppBottom(
            buttonColor: AppColors.whiteColor,
            borderColor: AppColors.redColor,
            borderCornerRadius: 40.r,
            buttonText: AppLocalizations.of(context)!.cancel,
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
