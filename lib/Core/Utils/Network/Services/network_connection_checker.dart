import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:flutter/material.dart';

class InternetChecker {
  InternetChecker._privateConstructor();
  static final InternetChecker instance =
      InternetChecker._privateConstructor();

  ValueNotifier<bool> isConnected = ValueNotifier(false);
  late final InternetConnectionChecker _checker;

  Future<void> init() async {
    _checker = InternetConnectionChecker.createInstance();

    _checker.onStatusChange.listen((status) {
      if (status == InternetConnectionStatus.connected) {
        isConnected.value = true;
      } else {
        isConnected.value = false;
      }
    });
    final hasConnection = await _checker.hasConnection;
    isConnected.value = hasConnection;
  }
}
