import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_getplaceaddress.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_searchlist.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_showAddress_sheet.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/mapCubit.dart';
import '../../../../Core/Utils/Text/text_style.dart';
import '../../../../Core/Utils/app_custom_widgets/custom_app_bottom.dart';
import 'custom_select_address_text_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class AddressBottomSheet extends StatefulWidget {
  AddressBottomSheet({
    super.key,
  });

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
          AutoSizeText(
            AppLocalizations.of(context)!.select_address,
            style: AppTextStyles.style18BlueBold,
          ),
          SelectAddressTextFormField(
            textStyle: AppTextStyles.style16DarkgrayW500,
            hinttextStyle: AppTextStyles.style16DarkgrayW500,
            onChanged: (value) {},
            controller: sourceController,
            hint: AppLocalizations.of(context)!.from,
            prefixicon: const Icon(Icons.location_searching_outlined),
            suffixicon: IconButton(
                onPressed: () async {
                  await mapsCubit.getUserLocation(title: 'title');
                  final address = await getAddressFromLatLng(
                      mapsCubit.orginPosition!.lat!,
                      mapsCubit.orginPosition!.lat!);
                  sourceController.text = address;
                  setState(() {});
                },
                icon: const Icon(Icons.my_location_sharp,
                    color: AppColors.redColor)),
          ),
          verticalSpace(20.h),
          CustomSearchlist(),
          verticalSpace(20.h),
          SizedBox(
            width: double.infinity,
            child: CustomAppBottom(
              buttonColor: AppColors.blueColor,
              textColor: AppColors.whiteColor,
              buttonText: AppLocalizations.of(context)!.go,
              onPressed: () {
                // ignore: use_build_context_synchronously
                Navigator.of(context).pop();
                showAddressBottomSheet(context);
              },
              hasIcon: false,
            ),
          )
        ],
      ),
    );
  }
}
