import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:taxi_go_user_version/Features/History/data/repo/history_repo_impl.dart';
import 'package:taxi_go_user_version/Features/Profile/data/repo/profile_repo_impl.dart';
import 'package:taxi_go_user_version/Features/Saved/data/repo/saved_repo_impl.dart';

import 'apiservices.dart';
import 'cach_helper.dart';
import 'internetconnection.dart';

final getIt = GetIt.instance;
Future<void> setup() async {
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());
  getIt.registerLazySingleton<Connectivity>(() => Connectivity());
  getIt.registerLazySingleton<InternetConnectivity>(
      () => MobileConnectivity(connectivity: getIt.get<Connectivity>()));

  getIt.registerSingleton<ApiService>(
      ApiService(internetConnectivity: getIt.get<InternetConnectivity>()));
  getIt.registerSingleton<HistoryRepoImpl>(
      HistoryRepoImpl(apiService: getIt.get<ApiService>()));
  getIt.registerSingleton<SavedRepoImpl>(
      SavedRepoImpl(apiService: getIt.get<ApiService>()));
  getIt.registerSingleton<ProfileRepoImpl>(
      ProfileRepoImpl(apiService: getIt.get<ApiService>()));

  //getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiService>()));
}
