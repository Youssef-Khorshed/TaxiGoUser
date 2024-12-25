import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/services_locator.dart';
import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/map_cubit/mapCubit.dart';
import 'package:taxi_go_user_version/Features/Home/controller/rate_%20cancel_cubit/rete_cancel_cubit.dart';
import 'package:taxi_go_user_version/Features/Home/controller/ride_complete_cubit/ride_complete_details_cubit.dart';
import 'package:taxi_go_user_version/Features/Home/data/repos/cancle_repo/cancel_repo.dart';
import 'package:taxi_go_user_version/Features/Home/data/repos/ride_complete_repo/ride_complete.dart';
import 'package:taxi_go_user_version/Features/Home/data/repos/tare_repo/rate_repo.dart';

import 'Core/Utils/localization/cubit/local_cubit.dart';

class TaxiGoUserEditionApp extends StatelessWidget {
  const TaxiGoUserEditionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => ScreenUtilInit(
        designSize: constraints.maxWidth >= 600
            ? const Size(200, 912)
            : constraints.maxWidth < 390
                ? const Size(490, 912)
                : const Size(390, 844),
        ensureScreenSize: true,
        minTextAdapt: true,
        builder: (context, child) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => LocalCubit()..isConnection(),
            ),
            BlocProvider(
              create: (context) =>
                  RideCompleteDetailsCubit(getIt<RideCompleteRepo>()),
            ),
            BlocProvider(create: (context) => getIt.get<MapsCubit>()),
            BlocProvider(
              create: (context) =>
                  RideCompleteDetailsCubit(getIt<RideCompleteRepo>()),
            ),
            BlocProvider(
              create: (context) =>
                  RateCancelCubit(getIt<RateRepo>(), getIt<CancelRepo>()),
            ),
            BlocProvider(
              create: (context) => LocalCubit()..isConnection(),
            ),
          ],
          child: BlocBuilder<LocalCubit, LocalState>(
            builder: (context, state) {
              return MaterialApp(
                locale: LocalCubit.get(context).localization,
                builder: DevicePreview.appBuilder,
                debugShowCheckedModeBanner: false,
                initialRoute: AppRoutes.splash,
                onGenerateRoute: AppRoutes.generateRoute,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
              );
            },
          ),
        ),
      ),
    );
  }
}
