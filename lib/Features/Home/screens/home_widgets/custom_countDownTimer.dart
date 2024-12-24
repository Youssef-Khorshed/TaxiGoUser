import 'dart:async';

import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/map_cubit/mapCubit.dart';

class CustomCountdowntimer extends StatefulWidget {
  const CustomCountdowntimer({super.key, this.title});

  final String? title;

  @override
  // ignore: library_private_types_in_public_api
  _CustomCountdowntimerState createState() => _CustomCountdowntimerState();
}

class _CustomCountdowntimerState extends State<CustomCountdowntimer> {
  final int _duration = 120;
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
            Navigator.pop(context);
            _timer?.cancel();
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
