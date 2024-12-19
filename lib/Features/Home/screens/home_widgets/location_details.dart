import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Assets/icons/app_icons.dart';
import 'package:taxi_go_user_version/Features/Home/data/models/ride_complete_model/ride_complete_details_model.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/trip_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocationDetails extends StatelessWidget {
  const LocationDetails({
    super.key,
    required this.rideDetails,
  });
  final RideCompleteDetailsModel rideDetails;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TripDetailsMap(
            address: "2972 Westheimer Rd. Santa Ana, Illinois 85486 ",
            location: "University",
            icon: AppIcons.iconsMapRed,
          ),
          TripDetailsMap(
            address: "1901 Thornridge Cir. Shiloh, Hawaii 81063",
            location: "Office",
            icon: AppIcons.iconsMapBlue,
          ),
        ],
      ),
      trailing: Text(
        "1.1 ${AppLocalizations.of(context)!.km}",
        style: TextStyle(fontSize: 15),
      ),
    );
  }
}
