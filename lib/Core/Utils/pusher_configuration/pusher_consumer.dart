import 'package:flutter/cupertino.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:taxi_go_user_version/Core/Utils/pusher_configuration/dynamic_listener.dart';

abstract class PusherConsumer<T> {
  Future<void> initialize();

  Future<void> connect();

  Future<void> disconnect();

  void subscribe(String channelName, String eventName, DynamicListener onEvent);

  void unsubscribe(String channelName);
}

class PusherConsumerImpl implements PusherConsumer {
  late PusherChannelsFlutter _pusher;

  final String appKey;
  final String cluster;

  PusherConsumerImpl({
    required this.appKey,
    required this.cluster,
  });

  @override
  Future<void> initialize() async {
    try {
      _pusher = PusherChannelsFlutter.getInstance();

      await _pusher.init(
        apiKey: appKey,
        cluster: cluster,
        logToConsole: true,
        onEvent: (event) {
          debugPrint("Pusher event: ${event.eventName}");
        },
        onSubscriptionSucceeded: (channel, value) {
          debugPrint("Pusher subscription succeeded: $value");
        },
        onConnectionStateChange: (currentState, previousState) {
          debugPrint("Connection state changed: $currentState");
        },
        onError: (message, code, exception) {
          debugPrint("Pusher error: $message");
        },
      );
      debugPrint('Pusher initialized successfully.');
    } catch (e) {
      debugPrint('Error initializing Pusher: $e');
    }
  }

  @override
  Future<void> connect() async {
    try {
      await _pusher.connect();
      debugPrint('Pusher connected.');
    } catch (e) {
      debugPrint('Error connecting to Pusher: $e');
    }
  }

  @override
  Future<void> disconnect() async {
    try {
      await _pusher.disconnect();
      debugPrint('Pusher disconnected.');
    } catch (e) {
      debugPrint('Error disconnecting from Pusher: $e');
    }
  }

  @override
  void subscribe(
      String channelName, String eventName, DynamicListener onEvent) {
    try {
      _pusher.subscribe(
        channelName: channelName,
        onEvent: onEvent,
      );
      debugPrint('Subscribed to $channelName.');
    } catch (e) {
      debugPrint('Error subscribing to channel $channelName: $e');
    }
  }

  @override
  void unsubscribe(String channelName) {
    try {
      _pusher.unsubscribe(channelName: channelName);
      debugPrint('Unsubscribed from $channelName.');
    } catch (e) {
      debugPrint('Error unsubscribing from channel $channelName: $e');
    }
  }
}
