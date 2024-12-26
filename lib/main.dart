import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Firebase/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:taxi_go_user_version/taxi_go_user_edition_app.dart';

import 'Core/Utils/Network/Services/cach_helper.dart';
import 'Core/Utils/Network/Services/services_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setup();
  await getIt<CacheHelper>().cacheInit();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(DevicePreview(
    enabled: true,
    builder: (context) => const TaxiGoUserEditionApp(),
  ));
}
