

import 'dart:convert';

ConfirmCodeRequestBody confirmCodeRequestBodyFromJson(String str) => ConfirmCodeRequestBody.fromJson(json.decode(str));

String confirmCodeRequestBodyToJson(ConfirmCodeRequestBody data) => json.encode(data.toJson());

class ConfirmCodeRequestBody {
  ConfirmCodeRequestBody({
    this.phone,
    this.code,
  });

  final String phone;
  final String code;

  factory ConfirmCodeRequestBody.fromJson(Map<String, dynamic> json) => ConfirmCodeRequestBody(
    phone: json["phone"],
    code: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "password": code,
  };
}
