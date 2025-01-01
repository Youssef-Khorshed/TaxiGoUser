import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/apiservices.dart';
import 'package:taxi_go_user_version/Features/Chat/data/repo/chatrepo.dart';
import '../../../../Core/Utils/Network/Error/failure.dart';
import '../../../../Core/Utils/Network/Services/api_constant.dart';
import '../model/message_data.dart';

class Chatrepoimp implements Chatrepo {
  final ApiService apiService;
  // final PusherConsumer _pusherConsumer;

  Chatrepoimp(
    this.apiService,
  );

  @override
  Future<Either<Failure, List<Message>>> getChatDetails({
    required BuildContext context,
  }) async {
    final response = await apiService.getRequest(
      Constants.rooms,
      context: context,
    );
    return response.fold(((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }), (ifRight) {
      if (ifRight.data["status"] == false) {
        return Left(ServerFailure(message: ifRight.data["message"]));
      } else {
        if (ifRight.data['data'] is List) {
          final messages = (ifRight.data['data'] as List)
              .map((json) => Message.fromJson(json as Map<String, dynamic>))
              .toList();
          return Right(messages);
        } else {
          return Left(ServerFailure(message: 'No Data'));
        }
      }
    });
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
}
