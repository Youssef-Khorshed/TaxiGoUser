import 'ride.dart';

class Data {
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
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Ride>? ride;

  Data({
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: num.tryParse(json['id'].toString()),
        customerId: num.tryParse(json['customer_id'].toString()),
        addressFrom: json['address_from']?.toString(),
        latFrom: json['lat_from']?.toString(),
        lngFrom: json['lng_from']?.toString(),
        addressTo: json['address_to']?.toString(),
        latTo: json['lat_to']?.toString(),
        lngTo: json['lng_to']?.toString(),
        tripType: num.tryParse(json['trip_type'].toString()),
        paymentMethod: json['payment_method']?.toString(),
        salePercentage: json['sale_percentage'],
        promocode: json['promocode'],
        promocodeId: json['promocode_id'],
        status: json['status']?.toString(),
        createdAt: json['created_at'] == null
            ? null
            : DateTime.tryParse(json['created_at'].toString()),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.tryParse(json['updated_at'].toString()),
        ride: (json['ride'] as List<dynamic>?)
            ?.map((e) => Ride.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (customerId != null) 'customer_id': customerId,
        if (addressFrom != null) 'address_from': addressFrom,
        if (latFrom != null) 'lat_from': latFrom,
        if (lngFrom != null) 'lng_from': lngFrom,
        if (addressTo != null) 'address_to': addressTo,
        if (latTo != null) 'lat_to': latTo,
        if (lngTo != null) 'lng_to': lngTo,
        if (tripType != null) 'trip_type': tripType,
        if (paymentMethod != null) 'payment_method': paymentMethod,
        if (salePercentage != null) 'sale_percentage': salePercentage,
        if (promocode != null) 'promocode': promocode,
        if (promocodeId != null) 'promocode_id': promocodeId,
        if (status != null) 'status': status,
        if (createdAt != null) 'created_at': createdAt?.toIso8601String(),
        if (updatedAt != null) 'updated_at': updatedAt?.toIso8601String(),
        if (ride != null) 'ride': ride?.map((e) => e.toJson()).toList(),
      };
}
