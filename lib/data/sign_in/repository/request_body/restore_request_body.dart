// To parse this JSON data, do
//
//     final restoreRequestBody = restoreRequestBodyFromJson(jsonString);

import 'dart:convert';

RestoreRequestBody restoreRequestBodyFromJson(String str) => RestoreRequestBody.fromJson(json.decode(str));

String restoreRequestBodyToJson(RestoreRequestBody data) => json.encode(data.toJson());

class RestoreRequestBody {
  RestoreRequestBody({
    this.phone,
  });

  final String phone;

  factory RestoreRequestBody.fromJson(Map<String, dynamic> json) => RestoreRequestBody(
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "phone": phone,
  };
}
