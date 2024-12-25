import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/map_cubit/mapCubit.dart';
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
  /// intialization of Objects
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());
  getIt.registerLazySingleton<Connectivity>(() => Connectivity());
  getIt.registerLazySingleton<InternetConnectivity>(
      () => MobileConnectivity(connectivity: getIt.get<Connectivity>()));
  getIt.registerFactory<PusherConsumer>(() => PusherConsumerImpl(
      appKey: PusherConsts.PUSHER_APP_KEY, cluster: PusherConsts.CLUSTER));
  getIt.registerSingleton<ApiService>(
      ApiService(internetConnectivity: getIt.get<InternetConnectivity>()));

  getIt.registerSingleton<Chatrepo>(
      Chatrepoimp(getIt.get<ApiService>(), getIt.get<PusherConsumer>()));
  getIt.registerSingleton<EventBindingManager>(EventBindingManager());
  getIt.registerFactory<ChatCubit>(
      () => ChatCubit(getIt.get<Chatrepo>(), getIt.get<EventBindingManager>()));

  /// For API Services
  getIt.registerLazySingleton<MapRepo>(() => Maprepoimp(apiService: getIt()));

  /// For Controller
  getIt.registerFactory(() => MapsCubit(mapsRepository: getIt()));
  //getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiService>()));
}
