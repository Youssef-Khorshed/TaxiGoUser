import 'package:flutter/material.dart';
import '../../../Core/Utils/Assets/images/app_images.dart';
import '../../../Core/Utils/Colors/app_colors.dart';
import '../../Home/screens/home_widgets/custom_address_buttom_sheet.dart';
import '../../Home/screens/home_widgets/custom_app_bottom.dart';
import '../../Home/screens/home_widgets/custom_enable_location_dialog.dart';

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
                  Image.asset(
                    AppImages.mapTest,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  Positioned(
                    top: 60,
                    right: 300,
                    left: 0,
                    child: CircleAvatar(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 20, left: 10, right: 5),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          iconSize: 25,
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                      backgroundColor: AppColors.transparentColor.withAlpha(
                        100,
                      ),
                    ),
                  ),
                ]),
              ),
              Positioned(
                bottom: 10,
                right: 15,
                left: 15,
                child: Row(
                  children: [
                    CustomAppBottom(
                      bottomColor: AppColors.blueColor,
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
                      text: 'Your Location',
                      textColor: AppColors.whiteColor,
                      hasIcon: true,
                    ),
                  ],
                ),
              ),
            ])));
  }
}
