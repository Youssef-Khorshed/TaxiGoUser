import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:taxi_go_user_version/Features/Auth/data/repo/auth_repo.dart';
import 'package:taxi_go_user_version/Features/Auth/data/repo/auth_repo_impl.dart';
import '../../../../Features/Auth/presentation/controller/create_profile_cubit/create_profile_cubit.dart';
import '../../../../Features/Auth/presentation/controller/log_out_cubit/log_out_cubit.dart';
import '../../../../Features/Auth/presentation/controller/login_cubit/login_cubit.dart';
import '../../../../Features/Auth/presentation/controller/otp_cubit/otp_cubit.dart';
import '../../../../Features/Auth/presentation/controller/set_new_password/set_new_password_cubit.dart';
import '../../../../Features/Auth/presentation/controller/set_password_cubit/set_password_cubit.dart';
import '../../../../Features/Auth/presentation/controller/sign_up_cubit.dart';
import 'apiservices.dart';
import 'cach_helper.dart';
import 'internetconnection.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  // Services
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());
  getIt.registerLazySingleton<Connectivity>(() => Connectivity());
  getIt.registerLazySingleton<InternetConnectivity>(
          () => MobileConnectivity(connectivity: getIt.get<Connectivity>()));
  getIt.registerSingleton<ApiService>(
      ApiService(internetConnectivity: getIt.get<InternetConnectivity>()));

  // Repositories
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(getIt.get<ApiService>()));

  // Cubits
  getIt.registerFactory<CreateProfileCubit>(() => CreateProfileCubit(getIt.get<AuthRepo>()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt.get<AuthRepo>()));
  getIt.registerFactory<OtpCubit>(() => OtpCubit(getIt.get<AuthRepo>()));
  getIt.registerFactory<SetPasswordCubit>(() => SetPasswordCubit(getIt.get<AuthRepo>()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt.get<AuthRepo>()));
  getIt.registerFactory<SetNewPasswordCubit>(() => SetNewPasswordCubit(getIt.get<AuthRepo>()));
  getIt.registerFactory<LogOutCubit>(() => LogOutCubit(getIt.get<AuthRepo>()));
}
