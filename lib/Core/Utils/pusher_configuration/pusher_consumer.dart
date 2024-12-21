import 'dart:developer';


import 'package:pusher_client/pusher_client.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/secure_token.dart';
import 'package:taxi_go_user_version/Core/Utils/pusher_configuration/dynamic_listener.dart';
import 'package:taxi_go_user_version/Core/Utils/pusher_configuration/pusher_consts.dart';
import 'package:taxi_go_user_version/Core/app_constants.dart';

import 'event_bounder_manager.dart';



abstract class PusherConsumer<T> {
  Future<void> initialize();

  Future<void> connect();

  Future<void> disconnect();

  //subscribe tp channel
  void subscribe(String channelName);

  void unsubscribe(String channelName);

  //bind event that listen for updates
  void bind(String channelName, String eventName, DynamicListener onEvent);

  void unbind(String channelName, String eventName);
}

class PusherConsumerImpl implements PusherConsumer {
  // Pusher fields
  late PusherClient _pusherClient;
  final Map<String, Channel> _channels = {}; // Map to store channels by name

  // Pusher configuration
  final String appKey;
  final String cluster;

  PusherConsumerImpl({
    required this.appKey,
    required this.cluster,
  });

  @override
  Future<void> initialize() async {
    try {
      final token = AppConstants.kTokenValue;

      if (token == null) {
        throw Exception("Access token is not available.");
      }

      _pusherClient = PusherClient(
        appKey,
        enableLogging: true,
        PusherOptions(
          cluster: cluster,
          auth: PusherAuth(
            PusherConsts.AUTH_URL,
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token',
            },
          ),
        ),
        autoConnect: false, // Manual connection
      );
      log('Pusher initialized');
    } catch (e) {
      log('Error whiile init pusher $e');
    }
  }

  // Pusher methods
  @override
  Future<void> connect() async {
    _pusherClient.connect();
  }

  @override
  Future<void> disconnect() async {
    await _pusherClient.disconnect();
  }

  @override
  void subscribe(String channelName) {
    if (!_channels.containsKey(channelName)) {
      _channels[channelName] = _pusherClient.subscribe(channelName);
    }
  }

  @override
  void unsubscribe(String channelName) {
    if (_channels.containsKey(channelName)) {
      _pusherClient.unsubscribe(channelName);
      _channels.remove(channelName); // Remove from map
    }
  }



  @override
  void bind(String channelName, String eventName, DynamicListener onEvent) {
    final channel = _channels[channelName];

    if (channel != null) {
      if (EventBindingManager().isEventBound(channelName, eventName)) {
        log('Event $eventName is already bound to channel $channelName');
        return;
      }

      channel.bind(eventName, (PusherEvent? event) {
        if (event != null) {
          onEvent(event.data);
        }
      });

      EventBindingManager().addBoundEvent(channelName, eventName);
      log('Event $eventName successfully bound to channel $channelName');
    } else {
      throw Exception("Channel $channelName is not subscribed. Bind failed.");
    }
  }
  @override
  void unbind(String channelName, String eventName) {
    final channel = _channels[channelName];

    if (channel != null) {
      channel.unbind(eventName);
      EventBindingManager().removeBoundEvent(channelName, eventName);

      log('Event $eventName unbound from channel $channelName');
    } else {
      throw Exception("Channel $channelName is not subscribed. Unbind failed.");
    }
  }
}
