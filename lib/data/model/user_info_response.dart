// To parse this JSON data, do
//
//     final userInfoRequestBody = userInfoRequestBodyFromJson(jsonString);

import 'dart:convert';

UserInfoResponse userInfoRequestBodyFromJson(String str) => UserInfoResponse.fromJson(json.decode(str));

String userInfoRequestBodyToJson(UserInfoResponse data) => json.encode(data.toJson());

class UserInfoResponse {
  UserInfoResponse({
    this.id,
    this.phone,
    this.name,
    this.surname,
    this.email,
  });

  final String id;
  final String phone;
  final String name;
  final String surname;
  final String email;

  factory UserInfoResponse.fromJson(Map<String, dynamic> json) => UserInfoResponse(
    id: json["_id"],
    phone: json["phone"],
    name: json["name"],
    surname: json["surname"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "phone": phone,
    "name": name,
    "surname": surname,
    "email": email,
  };
}
