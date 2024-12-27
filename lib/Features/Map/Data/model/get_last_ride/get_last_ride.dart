import 'data.dart';

class GetLastRide {
  bool? success;
  Data? data;

  GetLastRide({this.success, this.data});

  factory GetLastRide.fromJson(Map<String, dynamic> json) => GetLastRide(
        success: json['success']?.toString().contains("true"),
        data: json['data'] == null
            ? null
            : Data.fromJson(Map<String, dynamic>.from(json['data'])),
      );

  Map<String, dynamic> toJson() => {
        if (success != null) 'success': success,
        if (data != null) 'data': data?.toJson(),
      };
}
