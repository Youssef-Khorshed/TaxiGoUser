class RateModel {
  final dynamic status;
  final dynamic message;

  RateModel({required this.status, required this.message});

  factory RateModel.fromJson(Map<String, dynamic> json) {
    return RateModel(
      status: json["status"],
      message: json["message"],
    );
  }
}
