import 'dart:developer';

import 'package:taxi_go_user_version/Core/Utils/pusher_configuration/pusher_consumer.dart';

import 'dynamic_listener.dart';

class EventBindingManager {
  late PusherConsumer _pusherConsumer;
  Future<void> listenForMessages(DynamicListener onEvent) async {
    try {
      await _pusherConsumer.initialize();
      await _pusherConsumer.connect();
      _pusherConsumer.subscribe(".ride", "MessageSent", (data) {
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
