// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_addAdress_buttonAdd_sheet.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_searchlist.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/map_cubit/mapCubit.dart';

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
    final mapsCubit = context.read<MapsCubit>();
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.0.r),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0.r),
          topRight: Radius.circular(16.0.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close, color: Colors.grey),
            ),
          ),
          Text(
            AppLocalizations.of(context)!.select_address,
            style: AppTextStyles.style18BlueBold,
          ),
          CustomTextFormFiled(
            textStyle: AppTextStyles.style16DarkgrayW500,
            hinttextStyle: AppTextStyles.style16DarkgrayW500,
            onChanged: (value) {},
            controller: sourceController,
            hintText: widget.originTitle,
            prefixicon: const Icon(Icons.location_searching_outlined),
          ),
          verticalSpace(20.h),
          const CustomSearchlist(),
          verticalSpace(20.h),
          Custom_addAdress_buttonAdd_sheet(mapsCubit: mapsCubit)
        ],
      ),
    );
  }
}
