class CancelModel {
  final bool status;
  final String message;

  CancelModel({required this.status, required this.message});

  factory CancelModel.fromJson(Map<String, dynamic> json) {
    return CancelModel(
      status: json["success"],
      message: json["message"],
    );
  }
}
