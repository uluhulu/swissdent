import 'dart:convert';

BaseResponse baseResponseFromJson(String str) =>
    BaseResponse.fromJson(json.decode(str));

///Обложка для запросов
String baseResponseToJson(BaseResponse data) => json.encode(data.toJson());

class BaseResponse {
  BaseResponse({
    this.error,
    this.message,
    this.result,
  });

  final bool error;
  final String message;
  final dynamic result;

  factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(
        error: json["error"],
        message: json["message"],
        result: json["result"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "result": result,
      };
}
