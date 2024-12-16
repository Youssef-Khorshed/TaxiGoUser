import 'package:flutter/material.dart';

import '../../../../Core/Utils/Colors/app_colors.dart';
import '../../../../Core/Utils/app_custom_widgets/custom_app_bottom.dart';
import '../../../Auth/screens/auth_widgets/custom_auth_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              child: CustomAuthFormField(
                hintText: AppLocalizations.of(context)!.write_a_code,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: CustomAppBottom(
              onPressed: () {},
              buttonText: AppLocalizations.of(context)!.use_code,
              buttonColor: AppColors.blueColor,
              hasIcon: false,
              textColor: AppColors.whiteColor,
            ),
          )
        ],
      ),
    );
  }
}
