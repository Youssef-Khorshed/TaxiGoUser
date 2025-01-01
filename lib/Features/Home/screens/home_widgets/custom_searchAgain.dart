import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Core/Utils/app_custom_widgets/custom_app_bottom.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/customSearchingDriverSheet.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_bottomsheetStyle.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/map_cubit/mapCubit.dart';
import 'package:taxi_go_user_version/Features/Map/Data/model/rideRequestModel/ride/rideRequest.dart';

// ignore: must_be_immutable
class CustomSearchAgain extends StatefulWidget {
  String originTitle;
  String originSubTitle;
  String destinationTitle;
  String destinationSubTitle;
  String distance;
  String time;
  RideRequest request;
  CustomSearchAgain({
    super.key,
    required this.originTitle,
    required this.originSubTitle,
    required this.destinationTitle,
    required this.destinationSubTitle,
    required this.distance,
    required this.time,
    required this.request,
  });

  @override
  State<CustomSearchAgain> createState() => CustomSearchAgainState();
}

class CustomSearchAgainState extends State<CustomSearchAgain> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 15.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppLocalizations.of(context)!.search_again,
            style: AppTextStyles.style18BlackW500,
          ),
          verticalSpace(20.h),
          Row(
            children: [
              Expanded(
                child: CustomAppBottom(
                  borderCornerRadius: 40.r,
                  onPressed: () {
                    if (mounted) {
                      context
                          .read<MapsCubit>()
                          .riderequest(
                              context: context,
                              addressFrom: widget.request.data!.addressFrom!,
                              latFrom: widget.request.data!.latFrom!,
                              lngFrom: widget.request.data!.lngFrom!,
                              addressTo: widget.request.data!.addressTo!,
                              latTo: widget.request.data!.latTo!,
                              lngTo: widget.request.data!.lngTo!,
                              tripType: widget.request.data!.tripType!,
                              paymentMethod:
                                  widget.request.data!.paymentMethod!)
                          .then((onValue) {
                        Navigator.pop(context);
                        customBottomSheet(
                            context: context,
                            widget: CustomSearchingDriverSheet(
                              originTitle: widget.originTitle,
                              originSubTitle: widget.originSubTitle,
                              destinationTitle: widget.destinationTitle,
                              destinationSubTitle: widget.destinationSubTitle,
                              distance: widget.distance,
                              time: widget.time,
                              request: widget.request,
                            ));
                      });
                    }
                  },
                  buttonText: AppLocalizations.of(context)?.search,
                ),
              ),
              horizontalSpace(10.w),
              Expanded(
                child: CustomAppBottom(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, AppRoutes.generalScreen);
                  },
                  buttonColor: AppColors.whiteColor,
                  borderColor: AppColors.redColor,
                  borderCornerRadius: 40.r,
                  buttonText: AppLocalizations.of(context)!.cancel_k,
                  textColor: AppColors.redColor,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
