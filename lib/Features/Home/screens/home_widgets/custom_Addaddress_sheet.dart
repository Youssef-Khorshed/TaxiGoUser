// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_addAdress_buttonAdd_sheet.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_searchlist.dart';

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
      padding: EdgeInsets.symmetric(horizontal: 16.0.r),
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
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
          const CustomSearchlist(),
          verticalSpace(MediaQuery.of(context).size.width * 0.4),
          const Custom_addAdress_buttonAdd_sheet(),
          verticalSpace(20.h),
        ],
      ),
    );
  }
}
