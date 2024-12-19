import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/apiservices.dart';
import 'package:taxi_go_user_version/Features/Chat/data/repo/chatrepo.dart';
import '../../../../Core/Utils/Network/Services/api_constant.dart';

class Chatrepoimp implements Chatrepo {
  final ApiService apiService;
  late BuildContext context;

  Chatrepoimp(this.apiService);

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
}