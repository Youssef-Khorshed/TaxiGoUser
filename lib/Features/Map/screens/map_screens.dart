import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';
import 'package:taxi_go_user_version/Features/Map/map_widget/custom_map.dart';
import '../../../Core/Utils/Colors/app_colors.dart';
import '../../../Core/Utils/app_custom_widgets/custom_app_bottom.dart';
import '../../Home/screens/home_widgets/custom_address_buttom_sheet.dart';
import '../../Home/screens/home_widgets/custom_enable_location_dialog.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(children: [
                  const CustomMap(),
                  Positioned(
                    top: 60,
                    //  right: 300,
                    left: 20,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColors.transparentColor.withAlpha(
                        100,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 3.0),
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
                                onUseMyLocationPressed: () {
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
                                      return const AddressBottomSheet();
                                    },
                                  );
                                },
                                onSkipPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            );
                          },
                          buttonText: AppLocalizations.of(context)!
                              .select_your_location,
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: const Icon(
                            Icons.my_location_outlined,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ])));
  }
// zoom Levlel
// world -> 0 - 3
// country  -> 4 - 6
// city     -> 10 - 12
// street   -> 13 - 17
// building -> 18 - 20
}
