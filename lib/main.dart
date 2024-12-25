import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_go_user_version/Core/Firebase/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/api_constant.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/secure_token.dart';
import 'package:taxi_go_user_version/Features/Wallet/screens/bloc_observer.dart';
import 'package:taxi_go_user_version/taxi_go_user_edition_app.dart';

import 'Core/Utils/Network/Services/cach_helper.dart';
import 'Core/Utils/Network/Services/services_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await setup();
  await getIt<CacheHelper>().cacheInit();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SecureToken.addToken(Constants.userToken);
  runApp(DevicePreview(
    enabled: true,
    builder: (context) => const TaxiGoUserEditionApp(),
  ));
}
