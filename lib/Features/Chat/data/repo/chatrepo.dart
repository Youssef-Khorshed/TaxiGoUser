

import 'package:flutter/cupertino.dart';

import '../../../../Core/Utils/pusher_configuration/dynamic_listener.dart';

abstract class Chatrepo {

  Future<dynamic> getChatDetails({    required BuildContext context});
  Future<void> sendMessage({

   String? message,
    required Map data,
    required   String type,
    required BuildContext context
  });

  Future<void> listenForMessages({required DynamicListener onEvent}) ;

}
