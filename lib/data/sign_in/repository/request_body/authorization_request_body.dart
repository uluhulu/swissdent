
import 'dart:convert';

AuthorizationRequestBody authorizationRequestBodyFromJson(String str) => AuthorizationRequestBody.fromJson(json.decode(str));

String authorizationRequestBodyToJson(AuthorizationRequestBody data) => json.encode(data.toJson());

class AuthorizationRequestBody {
  AuthorizationRequestBody({
    this.phone,
    this.password,
  });

  final String phone;
  final String password;

  factory AuthorizationRequestBody.fromJson(Map<String, dynamic> json) => AuthorizationRequestBody(
    phone: json["phone"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "password": password,
  };
}