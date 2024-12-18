import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_bottomsheetStyle.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/mapCubit.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/mapState.dart';
import 'package:taxi_go_user_version/Features/Map/map_widget/custom_map.dart';
import 'package:uuid/uuid.dart';
import '../../../Core/Utils/Colors/app_colors.dart';
import '../../../Core/Utils/app_custom_widgets/custom_app_bottom.dart';
import '../../Home/screens/home_widgets/custom_Addaddress_sheet.dart';
import '../../Home/screens/home_widgets/custom_enable_location_dialog.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    final mapcubit = context.read<MapsCubit>();
    return Scaffold(
        body: Stack(children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(children: [
          const CustomMap(),
          Positioned(
            top: 60,
            //  right: 300,
            right: 20,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.transparentColor.withAlpha(
                100,
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 3.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, AppRoutes.generalScreen);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
      Positioned(
        bottom: 30,
        right: 15,
        left: 15,
        child: SizedBox(
          height: 54,
          child: Row(
            children: [
              Expanded(
                child: CustomAppBottom(
                  borderCornerRadius: 54,
                  iconColor: AppColors.whiteColor,
                  borderColor: AppColors.blueColor,
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (context) => EnableLocationDialog(
                        onUseMyLocationPressed: () async {
                          if (mounted) {
                            await mapcubit.getUserLocation(title: 'origin');
                            mapcubit.polyLines.clear();
                            if (mapcubit.state is OpenLoacationFailed) {
                            } else {
                              await mapcubit.emitPlaceAddress(
                                isorigin: true,
                                placeLatLng: LatLng(
                                  mapcubit.orginPosition!.lat!,
                                  mapcubit.orginPosition!.lng!,
                                ),
                                sessionToken: const Uuid().v4(),
                                context: context,
                              );
                              Navigator.of(context).pop();

                              customBottomSheet(
                                  context: context,
                                  widget: AddressBottomSheet(
                                    originTitle: mapcubit
                                        .originAddress.formattedAddress!,
                                  ));
                            }
                          }
                        },
                        onSkipPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    );
                  },
                  buttonText:
                      AppLocalizations.of(context)!.select_your_location,
                  textColor: AppColors.whiteColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: IconButton(
                      onPressed: () {
                        //  showAddressBottomSheet(context);
                      },
                      icon: const Icon(
                        Icons.my_location_outlined,
                        size: 30,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    ]));
  }
}
