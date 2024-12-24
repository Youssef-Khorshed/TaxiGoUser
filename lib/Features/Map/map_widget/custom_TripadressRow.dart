// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:taxi_go_user_version/Core/Utils/Assets/icons/app_icons.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/map_string_maipulation.dart';
import 'package:taxi_go_user_version/Features/Map/map_widget/trip_details_map.dart';

class CustomTripadressrow extends StatelessWidget {
  const CustomTripadressrow({
    super.key,
    required this.address,
    required this.iconmap,
  });
  final String address;
  final String iconmap;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, String>>(
      future: MapStringMaipulation.parseAddress(
        address,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: TripDetailsMap(
                    address: address,
                    location: " ",
                    icon: AppIcons.mapRedIcon,
                  ),
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: TripDetailsMap(
                    address: address,
                    location: " ",
                    icon: AppIcons.mapBlueIcon,
                  ),
                ),
              ],
            ),
          );
        }

        if (snapshot.hasError || !snapshot.hasData) {
          return const ListTile(
            title: Text("حدث خطأ أثناء جلب البيانات"),
          );
        }

        return TripDetailsMap(
          address: address,
          location:
              "${snapshot.data!['street_number']} ${snapshot.data!['city']} ",
          icon: iconmap,
        );
      },
    );
  }
}
