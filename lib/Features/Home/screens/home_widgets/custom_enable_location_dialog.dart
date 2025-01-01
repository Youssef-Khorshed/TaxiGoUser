import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Features/App/app_widgets/custom_loading.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/map_cubit/mapCubit.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/map_cubit/mapState.dart';
import '../../../../Core/Utils/Colors/app_colors.dart';
import '../../../../Core/Utils/Text/text_style.dart';

// ignore: must_be_immutable
class EnableLocationDialog extends StatelessWidget {
  final VoidCallback onUseMyLocationPressed;
  final VoidCallback onSkipPressed;

  const EnableLocationDialog({
    super.key,
    required this.onUseMyLocationPressed,
    required this.onSkipPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapsCubit, MapsState>(
      builder: (context, state) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          title: Column(
            children: [
              CircleAvatar(
                radius: 30.w,
                backgroundColor: AppColors.blueColor,
                child: Icon(
                  Icons.location_on,
                  color: AppColors.whiteColor,
                  size: 30.r,
                ),
              ),
              verticalSpace(10.h),
              Text(
                'تم تحديد موقعك',
                style: AppTextStyles.style18BlackW600,
                textAlign: TextAlign.center,
              ),
              // Text(
              //   'الان يمكنك الاستمتاع برحلتك',
              //   style: AppTextStyles.style14DarkgrayW500,
              //   textAlign: TextAlign.center,
              // )
            ],
          ),
          actionsOverflowAlignment: OverflowBarAlignment.center,
          actions: [
            state is PlaceAddressLoading
                ? const CustomLoading()
                : ElevatedButton(
                    onPressed: onUseMyLocationPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.blueColor,
                      minimumSize: Size(double.infinity, 48.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0.r),
                      ),
                    ),
                    child: Text(
                      'ابدأ رحلتك ',
                      style: AppTextStyles.style16WhiteW500,
                    ),
                  ),
          ],
        );
      },
    );
  }
}
