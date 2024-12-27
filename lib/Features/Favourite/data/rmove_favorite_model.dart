class RemoveFavoriteModel {
  bool? success;
  String? message;

  RemoveFavoriteModel({this.success, this.message});

  RemoveFavoriteModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }
}
