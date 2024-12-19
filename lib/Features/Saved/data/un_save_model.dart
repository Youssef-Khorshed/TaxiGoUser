class UnSaveModel {
  bool? success;
  String? message;

  UnSaveModel({this.success, this.message});

  UnSaveModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }
}
