import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/internetconnection.dart';
import 'package:taxi_go_user_version/Core/Utils/app_custom_widgets/custom_app_bottom.dart';
import 'package:taxi_go_user_version/Features/App/app_widgets/custom_loading.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_Addaddress_sheet.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_bottomsheetStyle.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_enable_location_dialog.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/map_cubit/mapCubit.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/map_cubit/mapState.dart';
import 'package:uuid/uuid.dart';

class CustomEnableDilaog extends StatelessWidget {
  const CustomEnableDilaog({
    super.key,
    required this.mounted,
    required this.mapCubit,
  });

  final bool mounted;
  final MapsCubit mapCubit;

  @override
  Widget build(BuildContext context) {
    return context.watch<MapsCubit>().state is GetUserLocationLoadingLoading
        ? const CustomLoading()
        : CustomAppBottom(
            borderCornerRadius: 54,
            iconColor: AppColors.whiteColor,
            borderColor: AppColors.blueColor,
            onPressed: () {
              mapCubit.getUserLocation(title: 'origin').then((onValue) {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (context) => EnableLocationDialog(
                    onUseMyLocationPressed: () async {
                      //  await mapCubit.getUserLocation(title: 'origin');
                      mapCubit.clearMarkerPolyines();
                      if (mapCubit.state is OpenLoacationFailed) {
                      } else {
                        await mapCubit.emitPlaceAddress(
                          isorigin: true,
                          placeLatLng: LatLng(
                            mapCubit.orginPosition!.lat!,
                            mapCubit.orginPosition!.lng!,
                          ),
                          sessionToken: const Uuid().v4(),
                          context: context,
                        );
                        Navigator.of(context).pop();
                        customBottomSheet(
                            context: context,
                            widget: AddressBottomSheet(
                              originTitle:
                                  mapCubit.originAddress.formattedAddress!,
                            ));
                      }
                    },
                    onSkipPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                );
              });
            },
            buttonText: AppLocalizations.of(context)!.select_your_location,
            textColor: AppColors.whiteColor,
          );
  }
}
