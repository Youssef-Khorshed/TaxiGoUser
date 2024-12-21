import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';

import '../../../../Features/Chat/data/repo/chatrepo.dart';
import '../../../../Features/Chat/data/repo/chatrepoimp.dart';
import '../../../../Features/Chat/model_view/manger/chat/chat_cubit.dart';
import '../../pusher_configuration/pusher_consts.dart';
import '../../pusher_configuration/pusher_consumer.dart';
import 'apiservices.dart';
import 'cach_helper.dart';
import 'internetconnection.dart';

final getIt = GetIt.instance;
Future<void> setup() async {
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());
  getIt.registerLazySingleton<Connectivity>(() => Connectivity());
  getIt.registerLazySingleton<InternetConnectivity>(
      () => MobileConnectivity(connectivity: getIt.get<Connectivity>()));
  getIt.registerFactory<PusherConsumer>(() => PusherConsumerImpl(
      appKey: PusherConsts.PUSHER_APP_KEY, cluster: PusherConsts.CLUSTER));
  getIt.registerSingleton<ApiService>(ApiService(internetConnectivity:getIt.get<InternetConnectivity>()));

  getIt.registerSingleton<Chatrepo>(Chatrepoimp(getIt.get<ApiService>(), getIt.get<PusherConsumer>()));

  getIt.registerFactory<ChatCubit>(() => ChatCubit(getIt.get<Chatrepo>()));



}
