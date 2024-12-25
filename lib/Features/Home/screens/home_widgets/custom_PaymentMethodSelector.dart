// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.darkgrayColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              height: 5.h,
              width: 134.w,
            ),
            verticalSpace(10.h),
            Text(
              AppLocalizations.of(context)!
                  .if_you_have_promo_code_you_can_get_a_discount,
              style: AppTextStyles.style14BlackW500,
            ),
            verticalSpace(10),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: CustomAppBottom(
                      onPressed: () {
                        context.read<MapsCubit>().checkPromocode(
                            context: context, code: controller.text);
                      },
                      buttonText: AppLocalizations.of(context)!.apply,
                    )),
                Expanded(
                  flex: 2,
                  child: CustomTextFormFiled(
                    controller: controller,
                    hintText: AppLocalizations.of(context)!.promo_code,
                    textStyle: AppTextStyles.style12DarkgrayW400,
                    hinttextStyle: AppTextStyles.style12DarkgrayW400,
                  ),
                ),
              ],
            ),
            verticalSpace(10.h),
            Text(AppLocalizations.of(context)!.select_payment_method,
                style: AppTextStyles.style16BlackW600),
            verticalSpace(10.h),
            paymentOption(
              context,
              method: AppLocalizations.of(context)!.wallet,
              icon: Icons.account_balance_wallet,
              subtitle: '${AppLocalizations.of(context)!.currency_iqd} 349',
            ),
            verticalSpace(10.h),
            paymentOption(
              context,
              method: AppLocalizations.of(context)!.cash,
              icon: Icons.attach_money,
              subtitle: '${AppLocalizations.of(context)!.currency_iqd} 349',
            ),
            verticalSpace(10.h),
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
            )
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
        color: isSelected ? AppColors.blueColor : AppColors.whiteColor,
        border: Border.all(color: AppColors.blueColor2, width: 1),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: ListTile(
        leading:
            Icon(icon, color: isSelected ? AppColors.whiteColor : Colors.black),
        title: Text(
          method,
          style: TextStyle(
              color: isSelected ? AppColors.whiteColor : Colors.black),
        ),
        subtitle: subtitle != null
            ? Text(subtitle,
                style: TextStyle(
                    color: isSelected ? AppColors.whiteColor : Colors.grey))
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
