import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_go_user_version/Core/Firebase/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:taxi_go_user_version/Features/Wallet/screens/bloc_observer.dart';
import 'package:taxi_go_user_version/taxi_go_user_edition_app.dart';
import 'package:connectivity_monitor/connectivity_monitor.dart';
import 'Core/Utils/Network/Services/cach_helper.dart';
import 'Core/Utils/Network/Services/services_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ConnectivityService.startConnectionNotifier();
  Bloc.observer = MyBlocObserver();
  await setup();
  await getIt<CacheHelper>().cacheInit();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(DevicePreview(
    enabled: false,
    builder: (context) => const TaxiGoUserEditionApp(),
  ));
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
