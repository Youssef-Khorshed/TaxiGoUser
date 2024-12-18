import 'package:get_it/get_it.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/apiservices.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/internetconnection.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/cach_helper.dart';
import 'package:taxi_go_user_version/Features/Home/data/repos/ride_complete_repo/ride_complete.dart';
import 'package:taxi_go_user_version/Features/Home/data/repos/ride_complete_repo/ride_complete_imp.dart';
import 'package:taxi_go_user_version/Features/Home/data/repos/tare_repo/rate_repo.dart';
import 'package:taxi_go_user_version/Features/Home/data/repos/tare_repo/rate_repo_imp.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/mapCubit.dart';
import 'package:taxi_go_user_version/Features/Map/Data/Repo/mapRepo.dart';
import 'package:taxi_go_user_version/Features/Map/Data/Repo/mapRepoimp.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// For Connectivity Services
    sl.registerLazySingleton(() => Connectivity());
    sl.registerLazySingleton<InternetConnectivity>(
        () => MobileConnectivity(connectivity: sl()));
    sl.registerLazySingleton(() => ApiService(internetConnectivity: sl()));

    /// For CacheHelper
    sl.registerLazySingleton<CacheHelper>(() => CacheHelper());

    /// For Repositories
    sl.registerLazySingleton<MapRepo>(() => Maprepoimp(apiService: sl()));
    sl.registerLazySingleton<RideCompleteRepo>(
        () => RideCompleteRepoImpl(apiService: sl()));
    sl.registerLazySingleton<RateRepo>(() => RateRepoImp(apiService: sl()));

    /// For Cubits/Controllers
    sl.registerFactory(() => MapsCubit(mapsRepository: sl()));
  }
}
