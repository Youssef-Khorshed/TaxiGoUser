import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Core/Utils/app_custom_widgets/custom_app_bottom.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_BuildAdressRow.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_EnableDilaog.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_OnGoingWayRider.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/mapCubit.dart';
import 'package:taxi_go_user_version/Features/Map/map_widget/custom_map.dart';
import '../../../Core/Utils/Colors/app_colors.dart';

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
        body: ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: Stack(children: [
        const CustomMap(),
        // Positioned(
        //   top: 60.h,
        //   right: 20.w,
        //   child: CircleAvatar(
        //     radius: 20.r,
        //     backgroundColor: AppColors.transparentColor.withAlpha(
        //       100,
        //     ),
        //     child: Padding(
        //       padding: EdgeInsets.only(right: 3.0.w),
        //       child: IconButton(
        //         onPressed: () {
        //           Navigator.pushReplacementNamed(
        //               context, AppRoutes.generalScreen);
        //         },
        //         icon: const Icon(
        //           Icons.arrow_back_ios,
        //           color: AppColors.whiteColor,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        // Positioned(
        //   bottom: 30.h,
        //   right: 15.w,
        //   left: 15.w,
        //   child: SizedBox(
        //     height: 54.h,
        //     child: Row(
        //       children: [
        //         CustomEnableDilaog(mounted: mounted, mapcubit: mapcubit),
        //         Padding(
        //           padding: const EdgeInsets.only(right: 10),
        //           child: Container(
        //             height: 50,
        //             width: 50,
        //             decoration: const BoxDecoration(
        //                 color: AppColors.whiteColor,
        //                 borderRadius: BorderRadius.all(Radius.circular(10))),
        //             child: IconButton(
        //                 onPressed: () {},
        //                 icon: const Icon(
        //                   Icons.my_location_outlined,
        //                   size: 30,
        //                 )),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),

        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: CustomOngoingwayrider(
            captinName: '',
            captinImage: '',
            captinRating: '',
            originTitle: '',
            originSubTitle: '',
            destinationTitle: '',
            destinationSubTitle: '',
            distance: '',
            time: '',
          ),
        )
      ]),
    ));
  }
}
