// To parse this JSON data, do
//
//     final token = tokenFromJson(jsonString);

import 'dart:convert';

Token tokenFromJson(String str) => Token.fromJson(json.decode(str));

String tokenToJson(Token data) => json.encode(data.toJson());

class Token {
  Token({
    this.token,
    this.expired,
  });

  final String token;
  final DateTime expired;

  factory Token.fromJson(Map<String, dynamic> json) => Token(
    token: json["token"],
    expired: DateTime.parse(json["expired"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "expired": expired.toIso8601String(),
  };
}
