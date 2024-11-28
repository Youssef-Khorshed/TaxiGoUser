import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import '../../../../Core/Utils/Text/text_style.dart';
import '../../../../Core/Utils/app_custom_widgets/custom_app_bottom.dart';
import 'change_address_buttom_sheet.dart';
import 'custom_select_address_text_form_field.dart';

class AddressBottomSheet extends StatelessWidget {
  const AddressBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: AppColors.ligterBlueColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
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
            'Select address',
            style: AppTextStyles.style18BlueBold,
          ),
          const SelectAddressTextFormField(
            labelText: "From",
            icon: Icon(Icons.location_searching_outlined),
            suffixIcon:
                Icon(Icons.my_location_sharp, color: AppColors.redColor),
            isFrom: true,
          ),
          const SelectAddressTextFormField(
            labelText: "To",
            icon: Icon(
              Icons.location_on_outlined,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: CustomAppBottom(
              buttonColor: AppColors.blueColor,
              textColor: AppColors.whiteColor,
              buttonText: 'Continue',
              onPressed: () {
                Navigator.of(context).pop();
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                  ),
                  builder: (context) {
                    return const ChangeAddressButtomSheet();
                  },
                );
              },
              hasIcon: false,
            ),
          )
        ],
      ),
    );
  }
}
