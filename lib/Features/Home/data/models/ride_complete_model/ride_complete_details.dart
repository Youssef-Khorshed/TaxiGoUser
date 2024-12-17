import 'ride.dart';

/// id : 5
/// customer_id : 7
/// address_from : "123 Main Street"
/// lat_from : "37.7486"
/// lng_from : "-122.4194"
/// address_to : "456 Another Street"
/// lat_to : "24.8123"
/// lng_to : "46.7124"
/// trip_type : 2
/// payment_method : "cash"
/// sale_percentage : null
/// promocode : null
/// promocode_id : null
/// status : "accepted"
/// created_at : "2024-12-17T12:51:20.000000Z"
/// updated_at : "2024-12-17T12:53:06.000000Z"
/// ride : [{"id":1,"ride_request_id":5,"captain_id":8,"status":"completed","distance":10,"time":0.095460416666667,"distance_price":"40.00","time_price":"0.14","discount":null,"total":"50.14","rate":null,"paid":"50.14","remainning_customer":null,"remainning_captain":null,"pickup_time":"2024-12-17T12:53:23.000000Z","arival_time":"2024-12-17T12:53:28.000000Z","created_at":"2024-12-17T12:53:06.000000Z","updated_at":"2024-12-17T12:57:21.000000Z","captain":{"id":8,"name":"hazem mahmoud","phone":"+9641558368866","address":null,"district_id":null,"city_id":null,"user_type":"captain","verified":1,"captain":1,"status":"active","available":0,"gender":"male","rate":null,"picture":null,"birthday":null,"lng":null,"lat":null,"customer_fcm":null,"captain_fcm":null,"last_otp":"$2y$12$vOGejtR8nONeymR0WwskaeMEO1bFqAHGd/ahAg5TCPrBSNDXsalzW","last_otp_expire":"2024-12-15 18:24:22","email_verified_at":null,"balance":"492.48","created_at":"2024-12-15T15:13:53.000000Z","updated_at":"2024-12-17T12:53:28.000000Z"}}]

class RideCompleteDetails {
  RideCompleteDetails({
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
    this.salePercentage,
    this.promocode,
    this.promocodeId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.ride,
  });

  RideCompleteDetails.fromJson(dynamic json) {
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
      ride = [];
      json['ride'].forEach((v) {
        ride?.add(Ride.fromJson(v));
      });
    }
  }
  num? id;
  num? customerId;
  String? addressFrom;
  String? latFrom;
  String? lngFrom;
  String? addressTo;
  String? latTo;
  String? lngTo;
  num? tripType;
  String? paymentMethod;
  dynamic salePercentage;
  dynamic promocode;
  dynamic promocodeId;
  String? status;
  String? createdAt;
  String? updatedAt;
  List<Ride>? ride;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['customer_id'] = customerId;
    map['address_from'] = addressFrom;
    map['lat_from'] = latFrom;
    map['lng_from'] = lngFrom;
    map['address_to'] = addressTo;
    map['lat_to'] = latTo;
    map['lng_to'] = lngTo;
    map['trip_type'] = tripType;
    map['payment_method'] = paymentMethod;
    map['sale_percentage'] = salePercentage;
    map['promocode'] = promocode;
    map['promocode_id'] = promocodeId;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (ride != null) {
      map['ride'] = ride?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
