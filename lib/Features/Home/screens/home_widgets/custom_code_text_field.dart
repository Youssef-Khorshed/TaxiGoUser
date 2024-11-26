import 'package:flutter/material.dart';

import '../../../../Core/Utils/Colors/app_colors.dart';
import '../../../Auth/screens/auth_widgets/custom_auth_form_field.dart';
import 'custom_app_bottom.dart';

class CodeTextField extends StatelessWidget {
  const CodeTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: Row(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width / 1.8,
              height: 40,
              child: const CustomAuthFormField(
                hintText: "Write a code",
              )),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: CustomAppBottom(
              onPressed: () {},
              text: "Use Code",
              bottomColor: AppColors.blueColor,
              hasIcon: false,
              textColor: AppColors.whiteColor,
            ),
          )
        ],
      ),
    );
  }
}
