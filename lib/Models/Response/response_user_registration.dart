import 'dart:convert';

ResponseUserRegistration responseUserRegistrationFromJson(
        String str, int _statusCode) =>
    ResponseUserRegistration.fromJson(json.decode(str), _statusCode);

String responseUserToJson(ResponseUserRegistration data) =>
    json.encode(data.toJson());

class ResponseUserRegistration {
  ResponseUserRegistration({
    required this.statusCode,
    required this.message,
    required this.accessToken,
  });

  String? message;
  String? accessToken;
  int? statusCode;

  factory ResponseUserRegistration.fromJson(
          Map<String, dynamic> json, _statusCode) =>
      ResponseUserRegistration(
        statusCode: _statusCode,
        message: json["msg"] ?? "",
        accessToken: json["accesstoken"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "accessToken": accessToken,
      };
}
