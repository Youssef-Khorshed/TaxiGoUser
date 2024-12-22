import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/apiservices.dart';
import 'package:taxi_go_user_version/Core/Utils/pusher_configuration/dynamic_listener.dart';
import 'package:taxi_go_user_version/Features/Chat/data/repo/chatrepo.dart';
import '../../../../Core/Utils/Network/Error/failure.dart';
import '../../../../Core/Utils/Network/Services/api_constant.dart';
import '../../../../Core/Utils/pusher_configuration/pusher_consumer.dart';
import '../model/message_data.dart';
class Chatrepoimp implements Chatrepo {
  final ApiService apiService;
  final PusherConsumer _pusherConsumer;

  Chatrepoimp(this.apiService, this._pusherConsumer);

  @override
  Future<Either<Failure, List<Message>>> getChatDetails({
    required BuildContext context,
  }) async {
    try {
      final response = await apiService.getRequest(
        Constants.rooms,
        context: context,
      );

      if (response != null && response['data'] is List) {
        final messages = (response['data'] as List)
            .map((json) => Message.fromJson(json as Map<String, dynamic>))
            .toList();
        return Right(messages);
      } else {
        return Left(ServerFailure(message: 'Invalid data format from server.'));
      }
    } catch (e) {
      log('Error fetching chat details: $e');
      return Left(ServerFailure(message: 'Failed to fetch chat details.'));
    }
  }



  @override
  Future<void> sendMessage({
    String? message,
    required Map data,
    required String type,
    required BuildContext context,
  }) async {
    try {
      final response = await apiService.postRequest(
        Constants.sendchat,
        context: context,
        body: data,
      );
      if (kDebugMode) {
        print('Response: $response');
      }
    } catch (e) {
      log('Error sending message: $e');
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