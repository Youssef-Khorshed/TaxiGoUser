import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/map_string_maipulation.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Features/App/app_widgets/custom_loading.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_bottomsheetStyle2.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_changeAddress_sheet.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/map_cubit/mapCubit.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/map_cubit/mapState.dart';
import 'package:uuid/uuid.dart';
import '../../../../Core/Utils/app_custom_widgets/custom_app_bottom.dart';

// ignore: camel_case_types
class Custom_addAdress_buttonAdd_sheet extends StatelessWidget {
  const Custom_addAdress_buttonAdd_sheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MapsCubit, MapsState>(
      listener: (context, state) {
        if (state is PlaceDirectionsFaild) {
        } else if (state is DirectionsLoaded) {
          final mapsCubit = context.read<MapsCubit>();
          Navigator.of(context).pop();
          customBottomSheet2(
              title: AppLocalizations.of(context)!.detalis_address,
              context: context,
              widget: CustomChangeaddressSheet(
                  originSubTitle: MapStringMaipulation.concatenateShortNames(
                      mapsCubit.originAddress.addressComponents),
                  destinationTitle: mapsCubit
                      .destinationAddress.addressComponents![3].longName!,
                  destinationSubTitle:
                      MapStringMaipulation.concatenateShortNames(
                          mapsCubit.destinationAddress.addressComponents),
                  originTitle:
                      mapsCubit.originAddress.addressComponents![3].longName!,
                  distance: mapsCubit.distanceTime.distance!.text!,
                  time: mapsCubit.distanceTime.duration!.text!));
        }
      },
      builder: (context, state) {
        MapsCubit mapsCubit = MapsCubit.get(context);
        if (state is PlaceDirectionsLading) {
          return const CustomLoading();
        }
        return Row(
          children: [
            Expanded(
              child: CustomAppBottom(
                buttonColor: AppColors.blueColor,
                textColor: AppColors.grayColor,
                borderCornerRadius: 15.r,
                buttonText: AppLocalizations.of(context)!.go,
                onPressed: () async {
                  await mapsCubit.emitPlaceDirections(
                      origin: LatLng(mapsCubit.orginPosition!.lat!,
                          mapsCubit.orginPosition!.lng!),
                      destination: LatLng(
                        mapsCubit.destinationostion!.lat!,
                        mapsCubit.destinationostion!.lng!,
                      ),
                      sessionToken: const Uuid().v4(),
                      context: context);
                },
              ),
            ),
            horizontalSpace(15.h),
            Expanded(
              child: CustomAppBottom(
                buttonColor: AppColors.whiteColor,
                borderColor: AppColors.redColor,
                borderCornerRadius: 15.r,
                buttonText: AppLocalizations.of(context)!.cancel_k,
                textColor: AppColors.redColor,
                onPressed: () {
                  context.read<MapsCubit>().clearMarkerPolyines();
                  Navigator.pop(context);
                },
              ),
            )
          ],
        );
      },
    );
  }
}
