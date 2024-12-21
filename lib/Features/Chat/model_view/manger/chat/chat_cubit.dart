
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_go_user_version/Features/Chat/data/repo/chatrepo.dart';
import '../../../data/model/message_data.dart';
part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this.chatrepo) : super(ChatInitial());
  final Chatrepo chatrepo;
  static ChatCubit get(context) => BlocProvider.of<ChatCubit>(context);

  Future<void> sendMessage(
      String message, Map data, String type,BuildContext context) async {

      await chatrepo.sendMessage(data: data, type: type, context: context,);

      emit(Chatsend());

  }
  void listenForMessages() {
    print('Start Listening');
    chatrepo.listenForMessages(onEvent: (data) {
      print('Raw Data: $data');
      final reply = jsonDecode(data);

      print('Parsed Data: $reply');
      final message = Message.fromJson(reply);

      print('Message: $message');
      emit(Chatsuccful([message]));
    });
  }








  Future<void> getChatdata(BuildContext context) async {
    emit(ChatLoad());
    try {
      final response = await chatrepo.getChatDetails(context: context);
      if (response != null && response['data'] is List) {
        final messages = (response['data'] as List)
            .map((json) => Message.fromJson(json as Map<String, dynamic>))
            .toList();
        emit(Chatsuccful(messages));
      } else {
        emit(Chatsuccful(const []));
      }
    } catch (e) {

    }
  }

}
