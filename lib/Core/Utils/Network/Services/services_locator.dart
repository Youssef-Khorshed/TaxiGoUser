import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:taxi_go_user_version/Features/Home/data/repos/cancle_repo/cancel_repo.dart';
import 'package:taxi_go_user_version/Features/Home/data/repos/cancle_repo/cancel_repo_imp.dart';
import 'package:taxi_go_user_version/Features/Home/data/repos/ride_complete_repo/ride_complete.dart';
import 'package:taxi_go_user_version/Features/Home/data/repos/ride_complete_repo/ride_complete_imp.dart';
import 'package:taxi_go_user_version/Features/Home/data/repos/tare_repo/rate_repo.dart';
import 'package:taxi_go_user_version/Features/Home/data/repos/tare_repo/rate_repo_imp.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/mapCubit.dart';
import 'package:taxi_go_user_version/Features/Map/Data/Repo/mapRepo.dart';
import 'package:taxi_go_user_version/Features/Map/Data/Repo/mapRepoimp.dart';

import '../../../../Features/Chat/data/repo/chatrepo.dart';
import '../../../../Features/Chat/data/repo/chatrepoimp.dart';
import '../../../../Features/Chat/model_view/manger/chat/chat_cubit.dart';
import '../../pusher_configuration/event_bounder_manager.dart';
import '../../pusher_configuration/pusher_consts.dart';
import '../../pusher_configuration/pusher_consumer.dart';
import 'apiservices.dart';
import 'cach_helper.dart';
import 'internetconnection.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  /// Initialization of Core Services
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());
  getIt.registerLazySingleton<Connectivity>(() => Connectivity());
  getIt.registerLazySingleton<InternetConnectivity>(
      () => MobileConnectivity(connectivity: getIt.get<Connectivity>()));
  getIt.registerSingleton<ApiService>(
      ApiService(internetConnectivity: getIt.get<InternetConnectivity>()));

  /// Pusher Services
  getIt.registerFactory<PusherConsumer>(() => PusherConsumerImpl(
      appKey: PusherConsts.PUSHER_APP_KEY, cluster: PusherConsts.CLUSTER));
  getIt.registerSingleton<EventBindingManager>(EventBindingManager());

  /// Chat Services
  getIt.registerSingleton<Chatrepo>(
      Chatrepoimp(getIt.get<ApiService>(), getIt.get<PusherConsumer>()));
  getIt.registerFactory<ChatCubit>(
      () => ChatCubit(getIt.get<Chatrepo>(), getIt.get<EventBindingManager>()));

  /// Map Repositories and Controllers
  getIt.registerLazySingleton<MapRepo>(() => Maprepoimp(apiService: getIt()));
  getIt.registerFactory(() => MapsCubit(mapsRepository: getIt()));

  /// Home Repositories
  getIt.registerLazySingleton<RideCompleteRepo>(
      () => RideCompleteRepoImpl(apiService: getIt()));
  getIt.registerLazySingleton<RateRepo>(() => RateRepoImp(apiService: getIt()));
  getIt.registerLazySingleton<CancelRepo>(
      () => CancelRepoImp(apiService: getIt()));
}
