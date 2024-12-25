import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import '../../../../../Core/Utils/Network/Error/failure.dart';
import '../../../../../Core/Utils/pusher_configuration/event_bounder_manager.dart';
import '../../../data/model/message_data.dart';
import '../../../data/repo/chatrepo.dart';
part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final Chatrepo chatrepo;
  final EventBindingManager _eventBindingManager;

  ChatCubit(this.chatrepo, this._eventBindingManager) : super(ChatInitial());

  Future<void> sendMessage(String message, Map<String, dynamic> data,
      String type, BuildContext context) async {
    try {
      await chatrepo.sendMessage(
        data: data,
        type: type,
        context: context,
      );

      // Retrieve the current message list
      final currentMessages =
          (state is Chatsuccful) ? (state as Chatsuccful).messages : [];

      // Add the new message to the current list
      final newMessage = Message(
        messageType: type,
        message: message,
        senderType: "user",
        lat: null,
        lng: null,
      );

      final updatedMessages = List<Message>.from(currentMessages)
        ..add(newMessage);

      emit(Chatsuccful(updatedMessages));
    } catch (e) {
      log('Error sending message: $e');
      emit(Chaterror());
    }
  }

  Future<Either<Failure, List<Message>>> getChatdata(
      BuildContext context) async {
    emit(ChatLoad());

    final response = await chatrepo.getChatDetails(context: context);

    response.fold(
      (failure) {
        emit(Chaterror());
      },
      (messages) {
        emit(Chatsuccful(messages));
      },
    );

    return response;
  }

  void listenForMessages() {
    _eventBindingManager.listenForMessages((event) {
      try {
        if (event is PusherEvent) {
          log('Raw Event: $event');
          final data = json.decode(event.data) as Map<String, dynamic>;
          // ignore: unused_local_variable
          final message = Message.fromJson(data);
        } else {
          log('Unexpected event type: $event');
        }
      } catch (e) {
        log('Error parsing message: $e');
      }
    });
  }
}
