// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/map_cubit/mapCubit.dart';
import 'package:taxi_go_user_version/Features/Map/Data/model/get_active_ride/get_active_ride.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class BookingDetailsAccepted extends StatefulWidget {
  GetActiveRide nearbyRideRequest;

  BookingDetailsAccepted({
    super.key,
    required this.nearbyRideRequest,
  });

  @override
  State<BookingDetailsAccepted> createState() => _BookingDetailsAcceptedState();
}

class _BookingDetailsAcceptedState extends State<BookingDetailsAccepted> {
  @override
  Widget build(BuildContext context) {
    final mapcubit = context.read<MapsCubit>();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                AppLocalizations.of(context)!.distance,
                style: AppTextStyles.style20BlackW500,
              ),
              Text(
                mapcubit.distanceTime.distance!.text!.toString(),
                style: AppTextStyles.style25BlackW400,
              ),
            ],
          ),
          Column(
            children: [
              AutoSizeText(
                AppLocalizations.of(context)!.time,
                style: AppTextStyles.style25BlackW400,
              ),
              Text(
                mapcubit.distanceTime.duration!.text!.toString(),
                style: AppTextStyles.style24DarkgrayW500,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
