import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';

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
        builder: (context, child) => BlocProvider(
            create: (context) => LocalCubit()..isConnection(),
            child:
                BlocBuilder<LocalCubit, LocalState>(builder: (context, state) {
              return MaterialApp(
                locale: LocalCubit.get(context).localization,
                builder: DevicePreview.appBuilder,
                debugShowCheckedModeBanner: false,
                initialRoute: AppRoutes.splash,
                onGenerateRoute: AppRoutes.generateRoute,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
              );
            })),
      ),
    );
  }
}
