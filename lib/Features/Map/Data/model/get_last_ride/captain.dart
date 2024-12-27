class Captain {
  num? id;
  String? name;
  String? phone;
  dynamic address;
  dynamic districtId;
  dynamic cityId;
  String? userType;
  num? verified;
  num? captain;
  String? status;
  num? available;
  String? gender;
  String? rate;
  dynamic picture;
  dynamic birthday;
  String? lng;
  String? lat;
  dynamic customerFcm;
  dynamic captainFcm;
  String? lastOtp;
  String? lastOtpExpire;
  dynamic emailVerifiedAt;
  String? balance;
  DateTime? createdAt;
  DateTime? updatedAt;

  Captain({
    this.id,
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
    this.updatedAt,
  });

  factory Captain.fromJson(Map<String, dynamic> json) => Captain(
        id: num.tryParse(json['id'].toString()),
        name: json['name']?.toString(),
        phone: json['phone']?.toString(),
        address: json['address'],
        districtId: json['district_id'],
        cityId: json['city_id'],
        userType: json['user_type']?.toString(),
        verified: num.tryParse(json['verified'].toString()),
        captain: num.tryParse(json['captain'].toString()),
        status: json['status']?.toString(),
        available: num.tryParse(json['available'].toString()),
        gender: json['gender']?.toString(),
        rate: json['rate']?.toString(),
        picture: json['picture'],
        birthday: json['birthday'],
        lng: json['lng']?.toString(),
        lat: json['lat']?.toString(),
        customerFcm: json['customer_fcm'],
        captainFcm: json['captain_fcm'],
        lastOtp: json['last_otp']?.toString(),
        lastOtpExpire: json['last_otp_expire']?.toString(),
        emailVerifiedAt: json['email_verified_at'],
        balance: json['balance']?.toString(),
        createdAt: json['created_at'] == null
            ? null
            : DateTime.tryParse(json['created_at'].toString()),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.tryParse(json['updated_at'].toString()),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (name != null) 'name': name,
        if (phone != null) 'phone': phone,
        if (address != null) 'address': address,
        if (districtId != null) 'district_id': districtId,
        if (cityId != null) 'city_id': cityId,
        if (userType != null) 'user_type': userType,
        if (verified != null) 'verified': verified,
        if (captain != null) 'captain': captain,
        if (status != null) 'status': status,
        if (available != null) 'available': available,
        if (gender != null) 'gender': gender,
        if (rate != null) 'rate': rate,
        if (picture != null) 'picture': picture,
        if (birthday != null) 'birthday': birthday,
        if (lng != null) 'lng': lng,
        if (lat != null) 'lat': lat,
        if (customerFcm != null) 'customer_fcm': customerFcm,
        if (captainFcm != null) 'captain_fcm': captainFcm,
        if (lastOtp != null) 'last_otp': lastOtp,
        if (lastOtpExpire != null) 'last_otp_expire': lastOtpExpire,
        if (emailVerifiedAt != null) 'email_verified_at': emailVerifiedAt,
        if (balance != null) 'balance': balance,
        if (createdAt != null) 'created_at': createdAt?.toIso8601String(),
        if (updatedAt != null) 'updated_at': updatedAt?.toIso8601String(),
      };
}
