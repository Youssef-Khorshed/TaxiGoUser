import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/map_cubit/mapCubit.dart';
import 'package:taxi_go_user_version/Features/Home/data/repos/cancle_repo/cancel_repo.dart';
import 'package:taxi_go_user_version/Features/Home/data/repos/cancle_repo/cancel_repo_imp.dart';
import 'package:taxi_go_user_version/Features/Home/data/repos/ride_complete_repo/ride_complete.dart';
import 'package:taxi_go_user_version/Features/Home/data/repos/ride_complete_repo/ride_complete_imp.dart';
import 'package:taxi_go_user_version/Features/Home/data/repos/tare_repo/rate_repo.dart';
import 'package:taxi_go_user_version/Features/Home/data/repos/tare_repo/rate_repo_imp.dart';
import 'package:taxi_go_user_version/Features/Map/Data/Repo/mapRepo.dart';
import 'package:taxi_go_user_version/Features/Map/Data/Repo/mapRepoimp.dart';
import 'package:taxi_go_user_version/Features/Wallet/controller/wallet_deposit_cubit/deposit_cubit.dart';
import 'package:taxi_go_user_version/Features/Wallet/controller/wallet_get_profile_cubit/cubit/wallet_get_profile_cubit.dart';
import 'package:taxi_go_user_version/Features/Wallet/controller/wallet_transactions_cubit/cubit/transaction_cubit.dart';
import 'package:taxi_go_user_version/Features/Wallet/data/repo/wallet_repo.dart';
import 'package:taxi_go_user_version/Features/Wallet/data/repo/wallet_repo_impl.dart';
import 'package:taxi_go_user_version/Features/notification/controller/cubit/get_all_notification_cubit.dart';

import '../../../../Features/Chat/data/repo/chatrepo.dart';
import '../../../../Features/Chat/data/repo/chatrepoimp.dart';
import '../../../../Features/Chat/model_view/manger/chat/chat_cubit.dart';
import '../../../../Features/notification/data/repo/notification_repo.dart';
import '../../../../Features/notification/data/repo/notification_repo_impl.dart';
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
  getIt.registerFactory<PusherConsumer>(() => PusherConsumerImpl(
      appKey: PusherConsts.PUSHER_APP_KEY, cluster: PusherConsts.CLUSTER));

  /// For API Services
  getIt.registerLazySingleton<MapRepo>(() => Maprepoimp(apiService: getIt()));

  /// For API Services
  getIt.registerLazySingleton<WalletRepo>(
      () => WalletRepoImpl(apiService: getIt()));

  getIt.registerLazySingleton<NotificationRepo>(
      () => NotificationRepoImpl(apiService: getIt()));

  getIt.registerSingleton<ApiService>(
      ApiService(internetConnectivity: getIt.get<InternetConnectivity>()));

  /// Pusher Services

  getIt.registerSingleton<Chatrepo>(
      Chatrepoimp(getIt.get<ApiService>(), getIt.get<PusherConsumer>()));
  getIt.registerSingleton<EventBindingManager>(EventBindingManager());
  getIt.registerFactory<ChatCubit>(() => ChatCubit(
        getIt.get<Chatrepo>(),
      ));

  /// For Controller
  getIt.registerFactory(() => WalletCubit(getIt()));
  getIt.registerFactory(() => TransactionCubit(getIt()));
  getIt.registerFactory(() => WalletGetProfileCubit(getIt()));
  getIt.registerFactory(() => GetAllNotificationCubit(getIt()));

  /// Map Repositories and Controllers
  getIt.registerFactory(() => MapsCubit(mapsRepository: getIt()));
  //getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiService>()));

  /// Home Repositories
  getIt.registerLazySingleton<RideCompleteRepo>(
      () => RideCompleteRepoImpl(apiService: getIt()));
  getIt.registerLazySingleton<RateRepo>(() => RateRepoImp(apiService: getIt()));
  getIt.registerLazySingleton<CancelRepo>(
      () => CancelRepoImp(apiService: getIt()));
}
