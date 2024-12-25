import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:taxi_go_user_version/Features/Home/data/repos/cancle_repo/cancel_repo.dart';
import 'package:taxi_go_user_version/Features/Home/data/repos/cancle_repo/cancel_repo_imp.dart';
import 'package:taxi_go_user_version/Features/Home/data/repos/ride_complete_repo/ride_complete.dart';
import 'package:taxi_go_user_version/Features/Home/data/repos/ride_complete_repo/ride_complete_imp.dart';
import 'package:taxi_go_user_version/Features/Home/data/repos/tare_repo/rate_repo.dart';
import 'package:taxi_go_user_version/Features/Home/data/repos/tare_repo/rate_repo_imp.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/map_cubit/mapCubit.dart';
import 'package:taxi_go_user_version/Features/Map/Data/Repo/mapRepo.dart';
import 'package:taxi_go_user_version/Features/Map/Data/Repo/mapRepoimp.dart';
import 'package:taxi_go_user_version/Features/Wallet/controller/wallet_deposit_cubit/deposit_cubit.dart';
import 'package:taxi_go_user_version/Features/Wallet/controller/wallet_get_profile_cubit/cubit/wallet_get_profile_cubit.dart';
import 'package:taxi_go_user_version/Features/Wallet/controller/wallet_transactions_cubit/cubit/transaction_cubit.dart';
import 'package:taxi_go_user_version/Features/Wallet/data/repo/wallet_repo.dart';
import 'package:taxi_go_user_version/Features/Wallet/data/repo/wallet_repo_impl.dart';
import 'package:taxi_go_user_version/Features/notification/controller/cubit/get_all_notification_cubit.dart';
import 'package:taxi_go_user_version/Features/Auth/data/repo/auth_repo.dart';
import 'package:taxi_go_user_version/Features/Auth/data/repo/auth_repo_impl.dart';
import 'package:taxi_go_user_version/Features/Auth/presentation/controller/create_profile_cubit/create_profile_cubit.dart';
import 'package:taxi_go_user_version/Features/Auth/presentation/controller/log_out_cubit/log_out_cubit.dart';
import 'package:taxi_go_user_version/Features/Auth/presentation/controller/login_cubit/login_cubit.dart';
import 'package:taxi_go_user_version/Features/Auth/presentation/controller/otp_cubit/otp_cubit.dart';
import 'package:taxi_go_user_version/Features/Auth/presentation/controller/set_new_password/set_new_password_cubit.dart';
import 'package:taxi_go_user_version/Features/Auth/presentation/controller/set_password_cubit/set_password_cubit.dart';
import 'package:taxi_go_user_version/Features/Auth/presentation/controller/sign_up_cubit.dart';
import 'package:taxi_go_user_version/Features/History/data/repo/history_repo_impl.dart';
import 'package:taxi_go_user_version/Features/Profile/data/repo/profile_repo_impl.dart';
import 'package:taxi_go_user_version/Features/Saved/data/repo/saved_repo_impl.dart';
import 'package:taxi_go_user_version/Features/Favourite/data/repo/favorite_repo_impl.dart';
import 'package:taxi_go_user_version/Features/Chat/data/repo/chatrepo.dart';
import 'package:taxi_go_user_version/Features/Chat/data/repo/chatrepoimp.dart';
import 'package:taxi_go_user_version/Features/Chat/model_view/manger/chat/chat_cubit.dart';
import 'package:taxi_go_user_version/Features/notification/data/repo/notification_repo.dart';
import 'package:taxi_go_user_version/Features/notification/data/repo/notification_repo_impl.dart';
import '../../pusher_configuration/event_bounder_manager.dart';
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

  getIt.registerSingleton<ApiService>(
      ApiService(internetConnectivity: getIt.get<InternetConnectivity>()));

  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<HistoryRepoImpl>(
      HistoryRepoImpl(apiService: getIt.get<ApiService>()));
  getIt.registerSingleton<SavedRepoImpl>(
      SavedRepoImpl(apiService: getIt.get<ApiService>()));
  getIt.registerSingleton<ProfileRepoImpl>(
      ProfileRepoImpl(apiService: getIt.get<ApiService>()));
  getIt.registerSingleton<FavoriteRepoImpl>(
      FavoriteRepoImpl(apiService: getIt.get<ApiService>()));

  getIt.registerFactory<CreateProfileCubit>(
      () => CreateProfileCubit(getIt.get<AuthRepo>()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt.get<AuthRepo>()));
  getIt.registerFactory<OtpCubit>(() => OtpCubit(getIt.get<AuthRepo>()));
  getIt.registerFactory<SetPasswordCubit>(
      () => SetPasswordCubit(getIt.get<AuthRepo>()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt.get<AuthRepo>()));
  getIt.registerFactory<SetNewPasswordCubit>(
      () => SetNewPasswordCubit(getIt.get<AuthRepo>()));
  getIt.registerFactory<LogOutCubit>(() => LogOutCubit(getIt.get<AuthRepo>()));

  getIt.registerLazySingleton<MapRepo>(
      () => Maprepoimp(apiService: getIt.get<ApiService>()));
  getIt.registerFactory<MapsCubit>(
      () => MapsCubit(mapsRepository: getIt.get<MapRepo>()));

  getIt.registerLazySingleton<WalletRepo>(
      () => WalletRepoImpl(apiService: getIt.get<ApiService>()));
  getIt.registerLazySingleton<NotificationRepo>(
      () => NotificationRepoImpl(apiService: getIt.get<ApiService>()));

  getIt.registerSingleton<EventBindingManager>(EventBindingManager());
  getIt.registerFactory<ChatCubit>(() => ChatCubit(getIt.get<Chatrepo>()));

  getIt
      .registerFactory<WalletCubit>(() => WalletCubit(getIt.get<WalletRepo>()));
  getIt.registerFactory<TransactionCubit>(
      () => TransactionCubit(getIt.get<WalletRepo>()));
  getIt.registerFactory<WalletGetProfileCubit>(
      () => WalletGetProfileCubit(getIt.get<WalletRepo>()));
  getIt.registerFactory<GetAllNotificationCubit>(
      () => GetAllNotificationCubit(getIt.get<NotificationRepo>()));

  getIt.registerLazySingleton<RideCompleteRepo>(
      () => RideCompleteRepoImpl(apiService: getIt.get<ApiService>()));
  getIt.registerLazySingleton<RateRepo>(
      () => RateRepoImp(apiService: getIt.get<ApiService>()));
  getIt.registerLazySingleton<CancelRepo>(
      () => CancelRepoImp(apiService: getIt.get<ApiService>()));
}
