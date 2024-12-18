import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/apiservices.dart';
import 'package:taxi_go_user_version/Features/Chat/data/repo/chatrepo.dart';

class Chatrepoimp implements Chatrepo{
  
 final ApiService apiService;
 late BuildContext context;

  Chatrepoimp(this.apiService);


  @override
  Future getChatDetails({required int? firstUser, required int? secondUser}) async {
    apiService.getRequest("https://go-taxi.codecraft1.com/api/captain/rides/send-message", context: context, );
  }

  @override
  Future<void> sendMessage({File? file, String? content, required int roomId, required int? userId, String ?type}) async {
    apiService.postRequest("https://go-taxi.codecraft1.com/api//captain/rides/get-messages", context: context,body: {




    });
    
    

  }





}