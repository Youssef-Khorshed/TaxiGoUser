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
  int? distance;
  String? total;
  String? rate;
  SavedRideRequest? rideRequest;
  SaveCaptain? saveCaptain;

  SavedRide({this.distance, this.total, this.rate, this.rideRequest});

  SavedRide.fromJson(Map<String, dynamic> json) {
    distance = json['distance'];

    total = json['total'];
    rate = json['rate'];

    saveCaptain =
        json['captain'] != null ? SaveCaptain.fromJson(json['captain']) : null;
    rideRequest = json['ride_request'] != null
        ? SavedRideRequest.fromJson(json['ride_request'])
        : null;
  }
}

class SavedRideRequest {
  String? latFrom;
  String? lngFrom;
  String? latTo;
  String? lngTo;

  SavedRideRequest({
    this.latFrom,
    this.lngFrom,
    this.latTo,
    this.lngTo,
  });

  SavedRideRequest.fromJson(Map<String, dynamic> json) {
    latFrom = json['lat_from'];
    lngFrom = json['lng_from'];

    latTo = json['lat_to'];
    lngTo = json['lng_to'];
  }
}

class SaveCaptain {
  String? name;
  String? phone;
  String? rate;
  String? picture;
  String? lng;
  String? lat;

  SaveCaptain({
    this.name,
    this.phone,
    this.rate,
    this.picture,
    this.lng,
    this.lat,
  });

  SaveCaptain.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];

    rate = json['rate'];
    picture = json['picture'];

    lng = json['lng'];
    lat = json['lat'];
  }
}
