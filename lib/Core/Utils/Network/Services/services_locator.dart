import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:taxi_go_user_version/Features/Wallet/controller/wallet_deposit_cubit/deposit_cubit.dart';
import 'package:taxi_go_user_version/Features/Wallet/controller/wallet_get_profile_cubit/cubit/wallet_get_profile_cubit.dart';
import 'package:taxi_go_user_version/Features/Wallet/controller/wallet_transactions_cubit/cubit/transaction_cubit.dart';
import 'package:taxi_go_user_version/Features/Wallet/data/repo/wallet_repo.dart';
import 'package:taxi_go_user_version/Features/Wallet/data/repo/wallet_repo_impl.dart';
import 'package:taxi_go_user_version/Features/notification/controller/cubit/get_all_notification_cubit.dart';

import '../../../../Features/notification/data/repo/notification_repo.dart';
import '../../../../Features/notification/data/repo/notification_repo_impl.dart';
import 'apiservices.dart';
import 'cach_helper.dart';
import 'internetconnection.dart';

final getIt = GetIt.instance;
Future<void> setup() async {
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());
  getIt.registerLazySingleton<Connectivity>(() => Connectivity());
  getIt.registerLazySingleton<InternetConnectivity>(
      () => MobileConnectivity(connectivity: getIt.get<Connectivity>()));

  /// For API Services
  getIt.registerLazySingleton<WalletRepo>(
      () => WalletRepoImpl(apiService: getIt()));

  getIt.registerLazySingleton<NotificationRepo>(
      () => NotificationRepoImpl(apiService: getIt()));

  getIt.registerSingleton<ApiService>(
      ApiService(internetConnectivity: getIt.get<InternetConnectivity>()));

  /// For Controller
  getIt.registerFactory(() => WalletCubit(getIt()));
  getIt.registerFactory(() => TransactionCubit(getIt()));
  getIt.registerFactory(() => WalletGetProfileCubit(getIt()));
  getIt.registerFactory(() => GetAllNotificationCubit(getIt()));

  //getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiService>()));
}
