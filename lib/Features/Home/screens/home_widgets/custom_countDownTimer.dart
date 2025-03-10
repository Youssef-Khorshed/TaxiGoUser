// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_bottomsheetStyle.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_searchAgain.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/map_cubit/mapCubit.dart';
import 'package:taxi_go_user_version/Features/Map/Data/model/rideRequestModel/ride/rideRequest.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomCountdowntimer extends StatefulWidget {
  final String originTitle;
  final String originSubTitle;
  final String destinationTitle;
  final String destinationSubTitle;
  final String distance;
  final String time;
  final RideRequest request;
  const CustomCountdowntimer({
    super.key,
    required this.originTitle,
    required this.originSubTitle,
    required this.destinationTitle,
    required this.destinationSubTitle,
    required this.distance,
    required this.time,
    required this.request,
    this.title,
  });

  final String? title;

  @override
  // ignore: library_private_types_in_public_api
  _CustomCountdowntimerState createState() => _CustomCountdowntimerState();
}

class _CustomCountdowntimerState extends State<CustomCountdowntimer> {
  final int _duration = 60;
  Timer? _timer;
  final int _intervalInSeconds = 5;

  final CountDownController _controller = CountDownController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularCountDownTimer(
        duration: _duration,
        initialDuration: 0,
        controller: _controller,
        width: 70.w,
        height: 70.h,
        ringColor: AppColors.grayColor,
        fillColor: AppColors.blueColor,
        backgroundColor: Colors.transparent,
        strokeWidth: 7.0,
        strokeCap: StrokeCap.round,
        textStyle: AppTextStyles.style18BlueBold,
        textFormat: CountdownTextFormat.S,
        isReverse: false,
        isReverseAnimation: false,
        isTimerTextShown: true,
        autoStart: true,
        onStart: () {
          if (mounted) {
            _timer =
                Timer.periodic(Duration(seconds: _intervalInSeconds), (timer) {
              context.read<MapsCubit>().getRideRequest(context: context);
            });
          }
        },
        onComplete: () {
          if (mounted) {
            context.read<MapsCubit>().getNoRideRequestTrip();
            _timer?.cancel();
            Navigator.pop(context);
            customBottomSheet(
                title: AppLocalizations.of(context)!.search_again,
                context: context,
                widget: CustomSearchAgain(
                  request: widget.request,
                  originTitle: widget.originTitle,
                  originSubTitle: widget.originSubTitle,
                  destinationTitle: widget.destinationTitle,
                  destinationSubTitle: widget.destinationSubTitle,
                  distance: widget.distance,
                  time: widget.time,
                ));
          }
        },
      ),
    );
  }

  @override
  dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
