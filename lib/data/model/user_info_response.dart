// To parse this JSON data, do
//
//     final userInfoRequestBody = userInfoRequestBodyFromJson(jsonString);

import 'dart:convert';

UserInfoResponseBody userInfoRequestBodyFromJson(String str) => UserInfoResponseBody.fromJson(json.decode(str));

String userInfoRequestBodyToJson(UserInfoResponseBody data) => json.encode(data.toJson());

class UserInfoResponseBody {
  UserInfoResponseBody({
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

  factory UserInfoResponseBody.fromJson(Map<String, dynamic> json) => UserInfoResponseBody(
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
