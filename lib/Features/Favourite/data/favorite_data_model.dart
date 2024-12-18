class FavoriteDataModel {
  bool? success;
  String? message;
  List<Data>? data;

  FavoriteDataModel({this.success, this.message, this.data});

  FavoriteDataModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
}

class Data {
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
  Null salePercentage;
  Null promocode;
  Null promocodeId;
  String? status;
  String? createdAt;
  String? updatedAt;
  List<Ride>? ride;

  Data(
      {this.id,
      this.customerId,
      this.addressFrom,
      this.latFrom,
      this.lngFrom,
      this.addressTo,
      this.latTo,
      this.lngTo,
      this.tripType,
      this.paymentMethod,
      this.salePercentage,
      this.promocode,
      this.promocodeId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.ride});

  Data.fromJson(Map<String, dynamic> json) {
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
    salePercentage = json['sale_percentage'];
    promocode = json['promocode'];
    promocodeId = json['promocode_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['ride'] != null) {
      ride = <Ride>[];
      json['ride'].forEach((v) {
        ride!.add(Ride.fromJson(v));
      });
    }
  }
}

class Ride {
  int? id;
  int? rideRequestId;
  int? captainId;
  String? status;
  int? distance;
  double? time;
  String? distancePrice;
  String? timePrice;
  Null discount;
  String? total;
  String? rate;
  String? paid;
  Null remainningCustomer;
  Null remainningCaptain;
  String? pickupTime;
  String? arivalTime;
  String? createdAt;
  String? updatedAt;

  Ride(
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
      this.paid,
      this.remainningCustomer,
      this.remainningCaptain,
      this.pickupTime,
      this.arivalTime,
      this.createdAt,
      this.updatedAt});

  Ride.fromJson(Map<String, dynamic> json) {
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
    paid = json['paid'];
    remainningCustomer = json['remainning_customer'];
    remainningCaptain = json['remainning_captain'];
    pickupTime = json['pickup_time'];
    arivalTime = json['arival_time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
