import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/apiservices.dart';
import 'package:taxi_go_user_version/Core/Utils/pusher_configuration/dynamic_listener.dart';
import 'package:taxi_go_user_version/Features/Chat/data/repo/chatrepo.dart';
import '../../../../Core/Utils/Network/Services/api_constant.dart';
import '../../../../Core/Utils/pusher_configuration/pusher_consumer.dart';

class Chatrepoimp implements Chatrepo {
  final ApiService apiService;
  late BuildContext context;
  final PusherConsumer _pusherConsumer;

  Chatrepoimp(this.apiService, this._pusherConsumer);

  @override
  @override
  Future<Map<String, dynamic>> getChatDetails({required BuildContext context}) async {
    final response = await apiService.getRequest(
      Constants.rooms,
      context: context,
    );
    return response;
  }

  @override

  @override
  Future<void> sendMessage({
    String? message,
    Map? data,
    required String type,
    required BuildContext context
  }) async {
      final response = await apiService.postRequest(
        Constants.sendchat,
        context: context,
        body: data,
      );
      if (kDebugMode) {
        print("$response");
      }


  }

  @override
  Future<void> listenForMessages({required DynamicListener onEvent}) async {
    try {
      await _pusherConsumer.initialize();
      await _pusherConsumer.connect();

      _pusherConsumer.subscribe(".ride");
      _pusherConsumer.bind(".ride", "send_message",
              (data) {
            try {
              onEvent(data);
            } catch (e) {
              log('Error parsing message: $e');
            }
          });
      log('Listening for new chat messages...');
    } catch (e) {
      log('Error initializing or subscribing to Pusher:$e');
    }
  }
}