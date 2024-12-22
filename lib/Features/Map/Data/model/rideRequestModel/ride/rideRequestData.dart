class RideRequestData {
  int? customerId;
  String? addressFrom;
  String? latFrom;
  String? lngFrom;
  String? addressTo;
  String? latTo;
  String? lngTo;
  int? tripType;
  String? paymentMethod;
  dynamic salePercentage;
  dynamic promocode;
  dynamic promocodeId;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  RideRequestData({
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
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory RideRequestData.fromJson(Map<String, dynamic> json) =>
      RideRequestData(
        customerId: json['customer_id'] as int?,
        addressFrom: json['address_from'] as String?,
        latFrom: json['lat_from'] as String?,
        lngFrom: json['lng_from'] as String?,
        addressTo: json['address_to'] as String?,
        latTo: json['lat_to'] as String?,
        lngTo: json['lng_to'] as String?,
        tripType: json['trip_type'] as int?,
        paymentMethod: json['payment_method'] as String?,
        salePercentage: json['sale_percentage'] as dynamic,
        promocode: json['promocode'] as dynamic,
        promocodeId: json['promocode_id'] as dynamic,
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        id: json['id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'customer_id': customerId,
        'address_from': addressFrom,
        'lat_from': latFrom,
        'lng_from': lngFrom,
        'address_to': addressTo,
        'lat_to': latTo,
        'lng_to': lngTo,
        'trip_type': tripType,
        'payment_method': paymentMethod,
        'sale_percentage': salePercentage,
        'promocode': promocode,
        'promocode_id': promocodeId,
        'updated_at': updatedAt?.toIso8601String(),
        'created_at': createdAt?.toIso8601String(),
        'id': id,
      };
}
