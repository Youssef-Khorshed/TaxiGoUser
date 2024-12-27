// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_go_user_version/Core/Utils/Assets/icons/app_icons.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/map_cubit/mapCubit.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/map_cubit/mapState.dart';
import 'package:taxi_go_user_version/Features/Map/Data/model/get_active_ride/get_active_ride.dart';
import 'package:taxi_go_user_version/Features/Map/map_widget/booking_details_accepted.dart';
import 'package:taxi_go_user_version/Features/Map/map_widget/custom_TripadressRow.dart';
import 'package:taxi_go_user_version/Features/Map/map_widget/requset_bottuns.dart';

// ignore: must_be_immutable
class RequestDialogBody extends StatefulWidget {
  GetActiveRide nearbyRideRequest;

  RequestDialogBody({
    super.key,
    required this.nearbyRideRequest,
    required this.width,
  });

  final double width;

  @override
  State<RequestDialogBody> createState() => _RequestDialogBodyState();
}

class _RequestDialogBodyState extends State<RequestDialogBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapsCubit, MapsState>(
      builder: (context, state) {
        var cubit = context.read<MapsCubit>();
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(),
              CustomTripadressrow(
                  address: widget.nearbyRideRequest.data!.addressFrom!,
                  iconmap: AppIcons.mapRedIcon),
              CustomTripadressrow(
                  address: widget.nearbyRideRequest.data!.addressTo!,
                  iconmap: AppIcons.mapBlueIcon),
              Visibility(
                visible: cubit.isAccepted,
                child: BookingDetailsAccepted(
                  nearbyRideRequest: widget.nearbyRideRequest,
                ),
              ),
              Visibility(
                  visible: cubit.isAccepted,
                  replacement: RequestButtons(
                    nearbyRideRequest: widget.nearbyRideRequest,
                  ),
                  child: const SizedBox()),
            ],
          ),
        );
      },
    );
  }
}
