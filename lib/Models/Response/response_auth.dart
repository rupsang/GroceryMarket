import 'dart:convert';

ResponseAuth responseAuthFromJson(String str, int statusCode) =>
    ResponseAuth.fromJson(json.decode(str), statusCode);

String responseAuthToJson(ResponseAuth data) => json.encode(data.toJson());

class ResponseAuth {
  ResponseAuth({
    required this.statusCode,
    required this.message,
    required this.token,
  });

  String? message;
  String? token;
  int? statusCode;

  factory ResponseAuth.fromJson(Map<String, dynamic> json, int _statusCode) =>
      ResponseAuth(
        statusCode: _statusCode,
        message: json["msg"],
        token: json["accesstoken"],
      );

  Map<String, dynamic> toJson() => {
        "msg": message ?? "",
        "accesstoken": token ?? "",
      };
}
