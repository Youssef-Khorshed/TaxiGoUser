import 'captain.dart';

/// id : 1
/// ride_request_id : 5
/// captain_id : 8
/// status : "completed"
/// distance : 10
/// time : 0.095460416666667
/// distance_price : "40.00"
/// time_price : "0.14"
/// discount : null
/// total : "50.14"
/// rate : null
/// paid : "50.14"
/// remainning_customer : null
/// remainning_captain : null
/// pickup_time : "2024-12-17T12:53:23.000000Z"
/// arival_time : "2024-12-17T12:53:28.000000Z"
/// created_at : "2024-12-17T12:53:06.000000Z"
/// updated_at : "2024-12-17T12:57:21.000000Z"
/// captain : {"id":8,"name":"hazem mahmoud","phone":"+9641558368866","address":null,"district_id":null,"city_id":null,"user_type":"captain","verified":1,"captain":1,"status":"active","available":0,"gender":"male","rate":null,"picture":null,"birthday":null,"lng":null,"lat":null,"customer_fcm":null,"captain_fcm":null,"last_otp":"$2y$12$vOGejtR8nONeymR0WwskaeMEO1bFqAHGd/ahAg5TCPrBSNDXsalzW","last_otp_expire":"2024-12-15 18:24:22","email_verified_at":null,"balance":"492.48","created_at":"2024-12-15T15:13:53.000000Z","updated_at":"2024-12-17T12:53:28.000000Z"}

class Ride {
  Ride({
    this.id,
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
    this.updatedAt,
    this.captain,
  });

  Ride.fromJson(dynamic json) {
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
    captain =
        json['captain'] != null ? Captain.fromJson(json['captain']) : null;
  }
  num? id;
  num? rideRequestId;
  num? captainId;
  String? status;
  num? distance;
  num? time;
  String? distancePrice;
  String? timePrice;
  dynamic discount;
  String? total;
  dynamic rate;
  String? paid;
  dynamic remainningCustomer;
  dynamic remainningCaptain;
  String? pickupTime;
  String? arivalTime;
  String? createdAt;
  String? updatedAt;
  Captain? captain;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['ride_request_id'] = rideRequestId;
    map['captain_id'] = captainId;
    map['status'] = status;
    map['distance'] = distance;
    map['time'] = time;
    map['distance_price'] = distancePrice;
    map['time_price'] = timePrice;
    map['discount'] = discount;
    map['total'] = total;
    map['rate'] = rate;
    map['paid'] = paid;
    map['remainning_customer'] = remainningCustomer;
    map['remainning_captain'] = remainningCaptain;
    map['pickup_time'] = pickupTime;
    map['arival_time'] = arivalTime;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (captain != null) {
      map['captain'] = captain?.toJson();
    }
    return map;
  }
}
