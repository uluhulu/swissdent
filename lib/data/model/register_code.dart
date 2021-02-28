// To parse this JSON data, do
//
//     final registerCode = registerCodeFromJson(jsonString);

import 'dart:convert';

class RegisterCode {
  RegisterCode({
    this.code,
  });

  final String code;

  factory RegisterCode.fromJson(Map<String, dynamic> json) => RegisterCode(
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
      };
}
