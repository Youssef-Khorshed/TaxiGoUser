import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/Utils/Colors/app_colors.dart';
import '../../../../Core/Utils/app_custom_widgets/custom_app_bottom.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../Auth/presentation/auth_widgets/custom_auth_form_field.dart';

class CodeTextField extends StatelessWidget {
  const CodeTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 5.h,
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
            padding: EdgeInsets.symmetric(
              vertical: 10.h,
            ),
            child: CustomAppBottom(
              onPressed: () {},
              buttonText: AppLocalizations.of(context)!.use_code,
              buttonColor: AppColors.blueColor,
              textColor: AppColors.whiteColor,
            ),
          )
        ],
      ),
    );
  }
}
