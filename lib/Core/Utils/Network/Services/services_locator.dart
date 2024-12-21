import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:taxi_go_user_version/Features/Auth/data/repo/auth_repo.dart';
import 'package:taxi_go_user_version/Features/Auth/data/repo/auth_repo_impl.dart';
import 'package:taxi_go_user_version/Features/Auth/screens/sign_up/controller/login_cubit/login_cubit.dart';
import 'package:taxi_go_user_version/Features/Auth/screens/sign_up/controller/otp_cubit/otp_cubit.dart';
import 'package:taxi_go_user_version/Features/Auth/screens/sign_up/controller/set_new_password/set_new_password_cubit.dart';

import '../../../../Features/Auth/screens/sign_up/controller/create_profile_cubit/create_profile_cubit.dart';
import '../../../../Features/Auth/screens/sign_up/controller/set_password_cubit/set_password_cubit.dart';
import '../../../../Features/Auth/screens/sign_up/controller/sign_up_cubit.dart';
import 'apiservices.dart';
import 'cach_helper.dart';
import 'internetconnection.dart';

final getIt = GetIt.instance;
Future<void> setup() async {
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());
  getIt.registerLazySingleton<Connectivity>(() => Connectivity());
  getIt.registerLazySingleton<InternetConnectivity>(
      () => MobileConnectivity(connectivity: getIt.get<Connectivity>()));



  //getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<ApiService>(
      ApiService(internetConnectivity: getIt.get<InternetConnectivity>()));

  //repo
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(getIt.get<ApiService>()));
  //cubit
  getIt.registerSingleton<CreateProfileCubit>(CreateProfileCubit(getIt.get<AuthRepo>()));
  getIt.registerSingleton<SignUpCubit>(SignUpCubit(getIt.get<AuthRepo>()));
  getIt.registerSingleton<OtpCubit>(OtpCubit(getIt.get<AuthRepo>()));
  getIt.registerSingleton<SetPasswordCubit>(SetPasswordCubit(getIt.get<AuthRepo>()));
getIt.registerSingleton<LoginCubit>(LoginCubit(getIt.get<AuthRepo>()));
  getIt.registerSingleton<SetNewPasswordCubit>(SetNewPasswordCubit(getIt.get<AuthRepo>()));

}
