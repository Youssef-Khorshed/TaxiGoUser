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
  SavedRideRequest? rideRequest;
  SaveCaptain? saveCaptain;

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
    saveCaptain =
        json['captain'] != null ? SaveCaptain.fromJson(json['captain']) : null;
    rideRequest = json['ride_request'] != null
        ? SavedRideRequest.fromJson(json['ride_request'])
        : null;
  }
}

class SavedRideRequest {
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

  SavedRideRequest({
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

  SavedRideRequest.fromJson(Map<String, dynamic> json) {
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

class SaveCaptain {
  int? id;
  String? name;
  String? phone;
  Null? address;
  Null? districtId;
  Null? cityId;
  String? userType;
  int? verified;
  int? captain;
  String? status;
  int? available;
  String? gender;
  String? rate;
  Null? picture;
  Null? birthday;
  String? lng;
  String? lat;
  Null? customerFcm;
  Null? captainFcm;
  String? lastOtp;
  String? lastOtpExpire;
  Null? emailVerifiedAt;
  String? balance;
  String? createdAt;
  String? updatedAt;

  SaveCaptain(
      {this.id,
      this.name,
      this.phone,
      this.address,
      this.districtId,
      this.cityId,
      this.userType,
      this.verified,
      this.captain,
      this.status,
      this.available,
      this.gender,
      this.rate,
      this.picture,
      this.birthday,
      this.lng,
      this.lat,
      this.customerFcm,
      this.captainFcm,
      this.lastOtp,
      this.lastOtpExpire,
      this.emailVerifiedAt,
      this.balance,
      this.createdAt,
      this.updatedAt});

  SaveCaptain.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    districtId = json['district_id'];
    cityId = json['city_id'];
    userType = json['user_type'];
    verified = json['verified'];
    captain = json['captain'];
    status = json['status'];
    available = json['available'];
    gender = json['gender'];
    rate = json['rate'];
    picture = json['picture'];
    birthday = json['birthday'];
    lng = json['lng'];
    lat = json['lat'];
    customerFcm = json['customer_fcm'];
    captainFcm = json['captain_fcm'];
    lastOtp = json['last_otp'];
    lastOtpExpire = json['last_otp_expire'];
    emailVerifiedAt = json['email_verified_at'];
    balance = json['balance'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
