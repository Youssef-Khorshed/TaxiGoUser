class Captain {
  int? id;
  String? name;
  String? phone;
  dynamic address;
  dynamic districtId;
  dynamic cityId;
  String? userType;
  int? verified;
  int? captain;
  String? status;
  int? available;
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
        id: json['id'] as int?,
        name: json['name'] as String?,
        phone: json['phone'] as String?,
        address: json['address'] as dynamic,
        districtId: json['district_id'] as dynamic,
        cityId: json['city_id'] as dynamic,
        userType: json['user_type'] as String?,
        verified: json['verified'] as int?,
        captain: json['captain'] as int?,
        status: json['status'] as String?,
        available: json['available'] as int?,
        gender: json['gender'] as String?,
        rate: json['rate'] as String?,
        picture: json['picture'] as dynamic,
        birthday: json['birthday'] as dynamic,
        lng: json['lng'] as String?,
        lat: json['lat'] as String?,
        customerFcm: json['customer_fcm'] as dynamic,
        captainFcm: json['captain_fcm'] as dynamic,
        lastOtp: json['last_otp'] as String?,
        lastOtpExpire: json['last_otp_expire'] as String?,
        emailVerifiedAt: json['email_verified_at'] as dynamic,
        balance: json['balance'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'phone': phone,
        'address': address,
        'district_id': districtId,
        'city_id': cityId,
        'user_type': userType,
        'verified': verified,
        'captain': captain,
        'status': status,
        'available': available,
        'gender': gender,
        'rate': rate,
        'picture': picture,
        'birthday': birthday,
        'lng': lng,
        'lat': lat,
        'customer_fcm': customerFcm,
        'captain_fcm': captainFcm,
        'last_otp': lastOtp,
        'last_otp_expire': lastOtpExpire,
        'email_verified_at': emailVerifiedAt,
        'balance': balance,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
