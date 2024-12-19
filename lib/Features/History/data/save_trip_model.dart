class SaveTripModel {
  bool? success;
  String? message;
  SaveTripData? data;

  SaveTripModel({this.success, this.message, this.data});

  SaveTripModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? SaveTripData.fromJson(json['data']) : null;
  }
}

class SaveTripData {
  int? userId;
  int? rideId;
  String? updatedAt;
  String? createdAt;
  int? id;

  SaveTripData(
      {this.userId, this.rideId, this.updatedAt, this.createdAt, this.id});

  SaveTripData.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    rideId = json['ride_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }
}
