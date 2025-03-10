import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/app_custom_widgets/custom_app_bottom.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/map_cubit/mapCubit.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/map_cubit/mapState.dart';
import 'package:taxi_go_user_version/Features/Map/Data/model/get_active_ride/get_active_ride.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RequestButtons extends StatelessWidget {
  final GetActiveRide nearbyRideRequest;

  const RequestButtons({
    super.key,
    required this.nearbyRideRequest,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapsCubit, MapsState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            verticalSpace(10.h),
            Expanded(
              child: CustomAppBottom(
                onPressed: () {
                  context.read<MapsCubit>().canelRideRequest(context: context);
                  Navigator.of(context)
                      .pushReplacementNamed(AppRoutes.generalScreen);
                },
                buttonText: AppLocalizations.of(context)!.cancel_k,
                buttonColor: Colors.white,
                textColor: Colors.red,
                borderColor: Colors.red,
              ),
            ),
            // horizontalSpace(10.w),
            // Expanded(
            //   child: CustomAppBottom(
            //     onPressed: () async {},
            //     buttonText: AppLocalizations.of(context)!.accept_k,
            //     buttonColor: AppColors.blueColor,
            //     textColor: AppColors.whiteColor,
            //   ),
            // ),
          ],
        );
      },
    );
  }
}
