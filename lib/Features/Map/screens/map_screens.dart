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
                            Navigator.pop(context);
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
                child: Row(
                  children: [
                    CustomAppBottom(
                      iconColor: AppColors.whiteColor,
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
                      text: 'Select Your Location',
                      textColor: AppColors.whiteColor,
                      hasIcon: true,
                    ),
                  ],
                ),
              ),
            ])));
  }
}
