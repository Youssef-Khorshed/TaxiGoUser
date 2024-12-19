import 'dart:io';

import 'package:flutter/cupertino.dart';

abstract class Chatrepo {
  Future<dynamic> getChatDetails({    required BuildContext context});
  Future<void> sendMessage({

   String? message,
    required Map data,
    required   String type,
    required BuildContext context
  });
}
