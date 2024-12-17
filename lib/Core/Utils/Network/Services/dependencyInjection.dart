import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/apiservices.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/internetconnection.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/mapCubit.dart';
import 'package:taxi_go_user_version/Features/Map/Data/Repo/mapRepo.dart';
import 'package:taxi_go_user_version/Features/Map/Data/Repo/mapRepoimp.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// For API Services
    sl.registerLazySingleton(() => ApiService(internetConnectivity: sl()));
    sl.registerLazySingleton<InternetConnectivity>(
        () => MobileConnectivity(connectivity: sl()));
    sl.registerLazySingleton(() => Connectivity());

    /// For Controller
    sl.registerFactory(() => MapsCubit(mapsRepository: sl()));
    sl.registerLazySingleton<MapRepo>(() => Maprepoimp(apiService: sl()));
  }
}
