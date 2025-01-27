import 'dart:async';
import 'dart:developer';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/api_constant.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/apiservices.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/cach_helper.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/internetconnection.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/services_locator.dart';
import 'package:taxi_go_user_version/main.dart';

class FirebaseNotification {
  static final ApiService apiServices =
      ApiService(internetConnectivity: getIt.get<InternetConnectivity>());
  static final FirebaseMessaging fcm = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static final StreamController<NotificationResponse> streamController =
      StreamController();

  static void onTap(NotificationResponse notificationResponse) {
    streamController.add(notificationResponse);
  }

  static Future<void> initNotifications() async {
    try {
      await AwesomeNotifications().initialize(
        null,
        [
          NotificationChannel(
            enableVibration: true,
            importance: NotificationImportance.High,
            channelGroupKey: 'basic_channel_group',
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: const Color(0xFF9D50DD),
            ledColor: Colors.white,
          )
        ],
        channelGroups: [
          NotificationChannelGroup(
            channelGroupKey: 'basic_channel_group',
            channelGroupName: 'Basic group',
          )
        ],
        debug: true,
      );

      AwesomeNotifications().setListeners(
        onActionReceivedMethod: NotificationController.onActionReceivedMethod,
        onNotificationCreatedMethod:
            NotificationController.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:
            NotificationController.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:
            NotificationController.onDismissActionReceivedMethod,
      );

      final bool isAllowed =
          await AwesomeNotifications().isNotificationAllowed();
      if (!isAllowed) {
        await AwesomeNotifications().requestPermissionToSendNotifications();
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error initializing notifications: $e');
      }
    }
  }

  static Future<void> removeToken(BuildContext context) async {
    try {
      await sendToken(firebaseToken: '', context: context);
      if (kDebugMode) {
        print("Token removed successfully");
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error removing token: $e');
      }
    }
  }

  static Future<void> init(BuildContext context) async {
    try {
      await fcm.requestPermission();
      final String? token = await fcm.getToken();
      if (kDebugMode) {
        log(token ?? 'No token found');
      }
      if (token != null) {
        await sendToken(
          context: context,
          firebaseToken: token,
        );
      }

      FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
        if (kDebugMode) {
          log('Received foreground message');
        }
        await _handleMessage(message);
      });

      FirebaseMessaging.onBackgroundMessage(handleBackGroundMessages);
    } catch (e) {
      if (kDebugMode) {
        print('Error initializing Firebase: $e');
      }
    }
  }

  static Future<void> _handleMessage(RemoteMessage message) async {
    try {
      final UserNotification userData = UserNotification.fromJson(message.data);
      await CacheHelper().cacheInit();
      final String title = userData.title;
      final String body = userData.body;

      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: UniqueKey().hashCode,
          channelKey: "basic_channel",
          title: title,
          body: body,
          payload: {},
          roundedLargeIcon: true,
          notificationLayout: NotificationLayout.Messaging,
        ),
      );
    } catch (e) {
      if (kDebugMode) {
        print('Error handling message: $e');
      }
    }
  }

  @pragma('vm:entry-point')
  static Future<void> handleBackGroundMessages(RemoteMessage message) async {
    try {
      await Firebase.initializeApp();
      if (kDebugMode) {
        print('Handling background message');
      }
      await _handleMessage(message);
    } catch (e) {
      if (kDebugMode) {
        print('Error handling background message: $e');
      }
    }
  }

  static Future<void> sendToken({
    required String? firebaseToken,
    required BuildContext context,
  }) async {
    try {
      final String sendTokenUrl =
          "${Constants.baseUrl}/notifications?fcm_token=${firebaseToken ?? ''}";

      await apiServices.getRequest(
        sendTokenUrl,
        context: context,
      );
    } catch (e) {
      if (kDebugMode) {
        print('Error sending token: $e');
      }
    }
  }
}

class UserNotification {
  final String title;
  final String body;

  const UserNotification({
    required this.title,
    required this.body,
  });

  factory UserNotification.fromJson(Map<String, dynamic> json) {
    return UserNotification(
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}

class NotificationController {
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    // Handle notification creation
  }

  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    // Handle notification display
  }

  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Handle notification dismissal
  }

  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    navigatorKey.currentState?.pushNamedAndRemoveUntil(
      '/notification-page',
      (route) => (route.settings.name != '/notification-page') || route.isFirst,
      arguments: receivedAction,
    );
  }
}
