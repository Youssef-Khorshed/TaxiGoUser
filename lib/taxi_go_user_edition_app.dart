import 'package:connectivity_monitor/connectivity_monitor.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/secure_token.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/services_locator.dart';
import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';
import 'package:taxi_go_user_version/Features/Favourite/controller/favorite_view_model.dart';
import 'package:taxi_go_user_version/Features/Favourite/data/repo/favorite_repo_impl.dart';
import 'package:taxi_go_user_version/Features/History/controller/history_view_model.dart';
import 'package:taxi_go_user_version/Features/History/data/repo/history_repo_impl.dart';
import 'package:taxi_go_user_version/Features/Home/controller/rate_%20cancel_cubit/rete_cancel_cubit.dart';
import 'package:taxi_go_user_version/Features/Home/controller/ride_complete_cubit/ride_complete_details_cubit.dart';
import 'package:taxi_go_user_version/Features/Home/data/repos/cancle_repo/cancel_repo.dart';
import 'package:taxi_go_user_version/Features/Home/data/repos/ride_complete_repo/ride_complete.dart';
import 'package:taxi_go_user_version/Features/Home/data/repos/tare_repo/rate_repo.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/map_cubit/mapCubit.dart';
import 'package:taxi_go_user_version/Features/Profile/controller/profile_view_model.dart';
import 'package:taxi_go_user_version/Features/Profile/data/repo/profile_repo_impl.dart';
import 'package:taxi_go_user_version/Features/Saved/controller/saved_view_model.dart';
import 'package:taxi_go_user_version/Features/Saved/data/repo/saved_repo_impl.dart';
import 'Core/Utils/localization/cubit/local_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TaxiGoUserEditionApp extends StatefulWidget {
  const TaxiGoUserEditionApp({super.key});

  @override
  State<TaxiGoUserEditionApp> createState() => _TaxiGoUserEditionAppState();
}

class _TaxiGoUserEditionAppState extends State<TaxiGoUserEditionApp> {
  String? token;
  bool? firstCheckInternet;
  @override
  void initState() {
    getToken();
    getfirstCheck();
    super.initState();
  }

  getToken() async {
    token = await SecureToken.getToken();
  }

  getfirstCheck() async {
    firstCheckInternet = await ConnectivityService.validateInternetConnection();
  }

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
            BlocProvider(
                create: (context) => HistoryViewModel(
                    historyRepo: getIt.get<HistoryRepoImpl>())),
            BlocProvider(
                create: (context) =>
                    SavedViewModel(savedRepo: getIt.get<SavedRepoImpl>())),
            BlocProvider(
                create: (context) => ProfileViewModel(
                    profileRepo: getIt.get<ProfileRepoImpl>())),
            BlocProvider(
                create: (context) => FavouriteViewModel(
                    favoriteRepo: getIt.get<FavoriteRepoImpl>())),
          ],
          child: BlocBuilder<LocalCubit, LocalState>(
            builder: (context, state) {
              return MaterialApp(
                locale: getIt.get<LocalCubit>().localization,
                builder: DevicePreview.appBuilder,
                debugShowCheckedModeBanner: false,
                initialRoute:
                    token != null ? AppRoutes.generalScreen : AppRoutes.splash,
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
