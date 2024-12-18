import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocode/geocode.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/app_custom_widgets/custom_app_bottom.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/customSearchingDriverSheet.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_PaymentMethodSelector.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_bottomsheetStyle.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/mapCubit.dart';

class PaymentButton extends StatelessWidget {
  const PaymentButton({
    super.key,
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
            buttonText: "Done",
            textColor: Colors.white,
            onPressed: () async {
              await context.read<MapsCubit>().riderequest(
                    context: context,
                    promocode: controller.text,
                    addressFrom: widget.addressFrom,
                    latFrom: context
                        .read<MapsCubit>()
                        .orginPosition!
                        .lat!
                        .toString(),
                    lngFrom: context
                        .read<MapsCubit>()
                        .orginPosition!
                        .lng!
                        .toString(),
                    addressTo: widget.addressTo,
                    latTo: context
                        .read<MapsCubit>()
                        .destinationostion
                        .lat!
                        .toString(),
                    lngTo: context
                        .read<MapsCubit>()
                        .destinationostion
                        .lng!
                        .toString(),
                    tripType: widget.tripType,
                    paymentMethod: selectedMethod,
                  );

              customBottomSheet(
                  context: context, widget: const CustomSearchingDriverSheet());
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
