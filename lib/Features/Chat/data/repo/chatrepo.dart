import 'dart:io';

abstract class Chatrepo {
  Future<dynamic> getChatDetails(
      {required int? firstUser, required int? secondUser});
  Future<void> sendMessage({
    File? file,
    String? content,
    required int roomId,
    required int? userId,
    String type,
  });
}
