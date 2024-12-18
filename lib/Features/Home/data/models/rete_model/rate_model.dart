class RateModel {
  final bool status;
  final String message;

  RateModel({required this.status, required this.message});

  factory RateModel.fromJson(Map<String, dynamic> json) {
    return RateModel(
      status: json["success"],
      message: json["message"],
    );
  }
}
