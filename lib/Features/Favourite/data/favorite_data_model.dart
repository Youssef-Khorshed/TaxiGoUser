class FavoriteDataModel {
  bool? success;
  String? message;
  List<FavoriteData>? data;

  FavoriteDataModel({this.success, this.message, this.data});

  FavoriteDataModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <FavoriteData>[];
      json['data'].forEach((v) {
        data!.add(FavoriteData.fromJson(v));
      });
    }
  }
}

class FavoriteData {
  int? id;
  Ride? ride;

  FavoriteData({this.ride, this.id});

  FavoriteData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ride = json['ride'] != null ? Ride.fromJson(json['ride']) : null;
  }
}

class Ride {
  int? distance;
  String? total;
  String? rate;
  RideRequestData? rideRequest;

  Ride({this.distance, this.total, this.rate, this.rideRequest});

  Ride.fromJson(Map<String, dynamic> json) {
    distance = json['distance'];

    total = json['total'];
    rate = json['rate'];

    rideRequest = json['ride_request'] != null
        ? RideRequestData.fromJson(json['ride_request'])
        : null;
  }
}

class RideRequestData {
  int? id;
  String? latFrom;
  String? lngFrom;
  String? latTo;
  String? lngTo;

  RideRequestData({
    this.id,
    this.latFrom,
    this.lngFrom,
    this.latTo,
    this.lngTo,
  });

  RideRequestData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    latFrom = json['lat_from'];
    lngFrom = json['lng_from'];
    latTo = json['lat_to'];
    lngTo = json['lng_to'];
  }
}
