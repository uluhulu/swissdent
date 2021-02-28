
import 'dart:convert';

UpdatePasswordRequestBody updatePasswordRequestBodyFromJson(String str) => UpdatePasswordRequestBody.fromJson(json.decode(str));

String updatePasswordRequestBodyToJson(UpdatePasswordRequestBody data) => json.encode(data.toJson());

class UpdatePasswordRequestBody {
  UpdatePasswordRequestBody({
    this.password,
  });

  final String password;

  factory UpdatePasswordRequestBody.fromJson(Map<String, dynamic> json) => UpdatePasswordRequestBody(
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "password": password,
  };
}
