// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Core/Utils/app_custom_widgets/custom_app_bottom.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/customAppFormField.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_paymentsheetButton.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/mapCubit.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/mapState.dart';

// ignore: must_be_immutable
class PaymentMethodSelector extends StatefulWidget {
  String addressFrom;
  String addressTo;
  int tripType;
  String originTitle;
  String destinationTitle;
  String distance;
  String time;
  PaymentMethodSelector({
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
  String selectedMethod = "wallet";
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
            // Promo Code
            Text(
              'If You have promo code you can get a Discount ',
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
                      buttonText: 'Apply',
                    )),
                Expanded(
                  flex: 2,
                  child: CustomTextFormFiled(
                    controller: controller,
                    hintText: 'Promo Code',
                    textStyle: AppTextStyles.style12DarkgrayW400,
                    hinttextStyle: AppTextStyles.style12DarkgrayW400,
                  ),
                ),
              ],
            ),
            verticalSpace(10.h),
            Text('Select Payment Method',
                style: AppTextStyles.style16BlackW600),
            verticalSpace(10.h),
            // wallet Payment
            walletpayment(),
            verticalSpace(10.h),
            // cash Payment
            cashpayment(),
            verticalSpace(10.h),

            // Buttons
            PaymentButton(
                originSubTitle: widget.addressFrom,
                originTitle: widget.originTitle,
                destinationSubTitle: widget.addressTo,
                destinationTitle: widget.destinationTitle,
                distance: widget.distance,
                time: widget.time,
                controller: controller,
                widget: widget,
                selectedMethod: selectedMethod)
          ],
        ),
      ),
    );
  }

  Container walletpayment() {
    return Container(
      decoration: BoxDecoration(
        color: selectedMethod == "wallet"
            ? AppColors.blueColor
            : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: ListTile(
        leading: Icon(Icons.account_balance_wallet,
            color: selectedMethod == "wallet"
                ? AppColors.whiteColor
                : Colors.black),
        title: Text(
          'My wallet',
          style: TextStyle(
              color: selectedMethod == "wallet"
                  ? AppColors.whiteColor
                  : Colors.black),
        ),
        subtitle: Text('\$349',
            style: TextStyle(
                color: selectedMethod == "wallet"
                    ? AppColors.whiteColor
                    : Colors.grey)),
        onTap: () {
          setState(() {
            selectedMethod = "wallet";
          });
        },
      ),
    );
  }

  Container cashpayment() {
    return Container(
      decoration: BoxDecoration(
        color: selectedMethod == "cash"
            ? AppColors.blueColor
            : AppColors.whiteColor,
        border: Border.all(color: AppColors.blueColor2, width: 1),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: ListTile(
        leading: Icon(Icons.attach_money,
            color:
                selectedMethod == "cash" ? AppColors.whiteColor : Colors.black),
        title: Text(
          'cash',
          style: TextStyle(
              color: selectedMethod == "cash"
                  ? AppColors.whiteColor
                  : Colors.black),
        ),
        onTap: () {
          setState(() {
            selectedMethod = "cash";
          });
        },
      ),
    );
  }
}
