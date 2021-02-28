import 'dart:convert';

String registerRequestBodyToJson(RegisterRequestBody data) =>
    json.encode(data.toJson());

class RegisterRequestBody {
  RegisterRequestBody({
    this.phone,
  });

  final String phone;

  factory RegisterRequestBody.fromJson(Map<String, dynamic> json) =>
      RegisterRequestBody(
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
      };
}
