
import 'dart:convert';

UpdateUserInfoRequestBody updateUserInfoRequestBodyFromJson(String str) => UpdateUserInfoRequestBody.fromJson(json.decode(str));

String updateUserInfoRequestBodyToJson(UpdateUserInfoRequestBody data) => json.encode(data.toJson());

class UpdateUserInfoRequestBody {
  UpdateUserInfoRequestBody({
    this.name,
    this.surname,
    this.email,
  });

  final String name;
  final String surname;
  final String email;

  factory UpdateUserInfoRequestBody.fromJson(Map<String, dynamic> json) => UpdateUserInfoRequestBody(
    name: json["name"],
    surname: json["surname"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "surname": surname,
    "email": email,
  };
}
