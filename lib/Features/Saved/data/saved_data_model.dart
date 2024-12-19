class SavedDataModel {
  bool? success;
  String? message;
  List<SavedData>? data;
  SavedDataModel({this.success, this.data, this.message});

  SavedDataModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <SavedData>[];
      json['data'].forEach((v) {
        data!.add(SavedData.fromJson(v));
      });
    }
  }
}

class SavedData {
  int? id;
  int? userId;
  int? rideId;
  SavedRide? ride;

  SavedData({this.id, this.userId, this.rideId, this.ride});

  SavedData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    rideId = json['ride_id'];
    ride = json['ride'] != null ? SavedRide.fromJson(json['ride']) : null;
  }
}

class SavedRide {
  int? id;
  int? rideRequestId;
  int? captainId;
  String? status;
  int? distance;
  double? time;
  String? distancePrice;
  String? timePrice;
  dynamic discount;
  String? total;
  String? rate;
  dynamic comment;
  String? paid;
  dynamic remainningCustomer;
  dynamic remainningCaptain;
  String? pickupTime;
  String? arivalTime;
  String? createdAt;
  String? updatedAt;
  RideRequest? rideRequest;

  SavedRide(
      {this.id,
      this.rideRequestId,
      this.captainId,
      this.status,
      this.distance,
      this.time,
      this.distancePrice,
      this.timePrice,
      this.discount,
      this.total,
      this.rate,
      this.comment,
      this.paid,
      this.remainningCustomer,
      this.remainningCaptain,
      this.pickupTime,
      this.arivalTime,
      this.createdAt,
      this.updatedAt,
      this.rideRequest});

  SavedRide.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rideRequestId = json['ride_request_id'];
    captainId = json['captain_id'];
    status = json['status'];
    distance = json['distance'];
    time = json['time'];
    distancePrice = json['distance_price'];
    timePrice = json['time_price'];
    discount = json['discount'];
    total = json['total'];
    rate = json['rate'];
    comment = json['comment'];
    paid = json['paid'];
    remainningCustomer = json['remainning_customer'];
    remainningCaptain = json['remainning_captain'];
    pickupTime = json['pickup_time'];
    arivalTime = json['arival_time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

class RideRequest {
  int? id;
  int? customerId;
  String? addressFrom;
  String? latFrom;
  String? lngFrom;
  String? addressTo;
  String? latTo;
  String? lngTo;
  int? tripType;
  String? paymentMethod;
  String? status;

  RideRequest({
    this.id,
    this.customerId,
    this.addressFrom,
    this.latFrom,
    this.lngFrom,
    this.addressTo,
    this.latTo,
    this.lngTo,
    this.tripType,
    this.paymentMethod,
    this.status,
  });

  RideRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    addressFrom = json['address_from'];
    latFrom = json['lat_from'];
    lngFrom = json['lng_from'];
    addressTo = json['address_to'];
    latTo = json['lat_to'];
    lngTo = json['lng_to'];
    tripType = json['trip_type'];
    paymentMethod = json['payment_method'];
    status = json['status'];
  }
}
