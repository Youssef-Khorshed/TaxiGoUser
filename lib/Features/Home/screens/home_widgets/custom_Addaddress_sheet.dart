// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_addAdress_buttonAdd_sheet.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_searchlist.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../Core/Utils/Text/text_style.dart';
import 'customAppFormField.dart';

// ignore: must_be_immutable
class AddressBottomSheet extends StatefulWidget {
  String originTitle;
  AddressBottomSheet({super.key, required this.originTitle});

  @override
  State<AddressBottomSheet> createState() => _AddressBottomSheetState();
}

class _AddressBottomSheetState extends State<AddressBottomSheet> {
  TextEditingController sourceController = TextEditingController();

  TextEditingController destinationController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .75,
      padding: EdgeInsets.all(16.0.r),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0.r),
          topRight: Radius.circular(16.0.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text(
              'اختار وجهتك',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
          ),
          verticalSpace(20.h),
          Text(
            'تبدا رحتلك من :',
            style: AppTextStyles.style16BlackW600,
          ),
          verticalSpace(10.h),
          CustomTextFormFiled(
            enabledborder: true,
            borderRadius: 12.r,
            bordercolor: AppColors.grayColor,
            focusedbordercolor: AppColors.blackColor,
            textStyle: AppTextStyles.style16DarkgrayW500,
            hinttextStyle: AppTextStyles.style16DarkgrayW500,
            onChanged: (value) {},
            controller: sourceController,
            hintText: widget.originTitle,
            prefixicon: const Icon(Icons.location_searching_outlined),
          ),
          verticalSpace(10.h),
          Text(
            'تتجهة رحلتك الي :',
            style: AppTextStyles.style16BlackW600,
          ),
          verticalSpace(10.h),
          const Expanded(child: CustomSearchlist()),
          const Custom_addAdress_buttonAdd_sheet()
        ],
      ),
    );
  }
}
