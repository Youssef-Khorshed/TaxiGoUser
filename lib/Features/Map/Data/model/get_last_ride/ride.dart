import 'captain.dart';

class Ride {
  num? id;
  num? rideRequestId;
  num? captainId;
  String? status;
  dynamic cancelReason;
  num? distance;
  num? time;
  String? distancePrice;
  String? timePrice;
  dynamic discount;
  String? total;
  dynamic rate;
  dynamic comment;
  dynamic paid;
  dynamic remainningCustomer;
  dynamic remainningCaptain;
  DateTime? pickupTime;
  DateTime? arivalTime;
  DateTime? createdAt;
  DateTime? updatedAt;
  Captain? captain;

  Ride({
    this.id,
    this.rideRequestId,
    this.captainId,
    this.status,
    this.cancelReason,
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
    this.captain,
  });

  factory Ride.fromJson(Map<String, dynamic> json) => Ride(
        id: num.tryParse(json['id'].toString()),
        rideRequestId: num.tryParse(json['ride_request_id'].toString()),
        captainId: num.tryParse(json['captain_id'].toString()),
        status: json['status']?.toString(),
        cancelReason: json['cancel_reason'],
        distance: num.tryParse(json['distance'].toString()),
        time: num.tryParse(json['time'].toString()),
        distancePrice: json['distance_price']?.toString(),
        timePrice: json['time_price']?.toString(),
        discount: json['discount'],
        total: json['total']?.toString(),
        rate: json['rate'],
        comment: json['comment'],
        paid: json['paid'],
        remainningCustomer: json['remainning_customer'],
        remainningCaptain: json['remainning_captain'],
        pickupTime: json['pickup_time'] == null
            ? null
            : DateTime.tryParse(json['pickup_time'].toString()),
        arivalTime: json['arival_time'] == null
            ? null
            : DateTime.tryParse(json['arival_time'].toString()),
        createdAt: json['created_at'] == null
            ? null
            : DateTime.tryParse(json['created_at'].toString()),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.tryParse(json['updated_at'].toString()),
        captain: json['captain'] == null
            ? null
            : Captain.fromJson(Map<String, dynamic>.from(json['captain'])),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (rideRequestId != null) 'ride_request_id': rideRequestId,
        if (captainId != null) 'captain_id': captainId,
        if (status != null) 'status': status,
        if (cancelReason != null) 'cancel_reason': cancelReason,
        if (distance != null) 'distance': distance,
        if (time != null) 'time': time,
        if (distancePrice != null) 'distance_price': distancePrice,
        if (timePrice != null) 'time_price': timePrice,
        if (discount != null) 'discount': discount,
        if (total != null) 'total': total,
        if (rate != null) 'rate': rate,
        if (comment != null) 'comment': comment,
        if (paid != null) 'paid': paid,
        if (remainningCustomer != null)
          'remainning_customer': remainningCustomer,
        if (remainningCaptain != null) 'remainning_captain': remainningCaptain,
        if (pickupTime != null) 'pickup_time': pickupTime?.toIso8601String(),
        if (arivalTime != null) 'arival_time': arivalTime?.toIso8601String(),
        if (createdAt != null) 'created_at': createdAt?.toIso8601String(),
        if (updatedAt != null) 'updated_at': updatedAt?.toIso8601String(),
        if (captain != null) 'captain': captain?.toJson(),
      };
}
