// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Core/Utils/app_custom_widgets/custom_app_bottom.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/customAppFormField.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_paymentsheetButton.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/map_cubit/mapCubit.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/map_cubit/mapState.dart';

class PaymentMethodSelector extends StatefulWidget {
  final String addressFrom;
  final String addressTo;
  final int tripType;
  final String originTitle;
  final String destinationTitle;
  final String distance;
  final String time;

  const PaymentMethodSelector({
    super.key,
    required this.addressFrom,
    required this.addressTo,
    required this.tripType,
    required this.originTitle,
    required this.destinationTitle,
    required this.distance,
    required this.time,
  });

  @override
  // ignore: library_private_types_in_public_api
  _PaymentMethodSelectorState createState() => _PaymentMethodSelectorState();
}

class _PaymentMethodSelectorState extends State<PaymentMethodSelector> {
  String selectedMethod = "";
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<MapsCubit, MapsState>(
      listener: (context, state) {
        if (state is CheckPromocodeFail) {
          Fluttertoast.showToast(
              msg: state.message,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
        if (state is RideRequestFail) {
          Fluttertoast.showToast(
              msg: state.message,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
//            verticalSpace(20.h),
            // Center(
            //   child: Text(
            //     AppLocalizations.of(context)!.tripDetails,
            //     style: AppTextStyles.style18BlackBold,
            //   ),
            // ),

            // verticalSpace(25.h),

            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: CustomTextFormFiled(
                    controller: controller,
                    hintText: AppLocalizations.of(context)!.promo_code,
                    textStyle: AppTextStyles.style12DarkgrayW400,
                    hinttextStyle: AppTextStyles.style12DarkgrayW400,
                    borderRadius: 15.r,
                  ),
                ),
                horizontalSpace(15.h),
                Expanded(
                    flex: 1,
                    child: CustomAppBottom(
                      onPressed: () {
                        context.read<MapsCubit>().checkPromocode(
                            context: context, code: controller.text);
                      },
                      buttonText: AppLocalizations.of(context)!.apply,
                      borderCornerRadius: 15,
                      buttonColor: AppColors.whiteColor,
                      textColor: AppColors.blueColor,
                    )),
              ],
            ),
            verticalSpace(20.h),
            Text(AppLocalizations.of(context)!.select_payment_method,
                style: AppTextStyles.style16BlackW600),
            verticalSpace(20.h),
            paymentOption(
              context,
              method: AppLocalizations.of(context)!.wallet,
              icon: Icons.account_balance_wallet,
              subtitle: ' 349 ${AppLocalizations.of(context)!.currency_iqd}',
            ),
            verticalSpace(20.h),
            paymentOption(
              context,
              method: AppLocalizations.of(context)!.cash,
              icon: Icons.attach_money,
              subtitle: ' 349 ${AppLocalizations.of(context)!.currency_iqd}',
            ),
            verticalSpace(30.h),
            PaymentButton(
              originSubTitle: widget.addressFrom,
              originTitle: widget.originTitle,
              destinationSubTitle: widget.addressTo,
              destinationTitle: widget.destinationTitle,
              distance: widget.distance,
              time: widget.time,
              controller: controller,
              widget: widget,
              selectedMethod: selectedMethod == "المحفظه" ? "wallet" : "cash",
            ),
            verticalSpace(20.h),
          ],
        ),
      ),
    );
  }

  Widget paymentOption(BuildContext context,
      {required String method, required IconData icon, String? subtitle}) {
    final isSelected = selectedMethod == method;
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
            color: isSelected ? AppColors.blueColor : AppColors.darkgrayColor,
            width: 1),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.black),
        title: Text(
          method,
          style: const TextStyle(color: Colors.black),
        ),
        trailing: subtitle != null
            ? Text(subtitle,
                style: const TextStyle(color: AppColors.darkgrayColor))
            : null,
        onTap: () {
          setState(() {
            selectedMethod = method;
          });
        },
      ),
    );
  }
}
