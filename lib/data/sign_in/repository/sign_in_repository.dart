import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:swissdent/constants/keys.dart';
import 'package:swissdent/constants/url.dart';
import 'package:swissdent/data/model/register_code.dart';
import 'package:swissdent/data/model/token.dart';
import 'package:swissdent/data/sign_in/repository/request_body/authorization_request_body.dart';
import 'package:swissdent/data/sign_in/repository/request_body/confirm_code_request_body.dart';
import 'package:swissdent/data/sign_in/repository/request_body/register_request_body.dart';
import 'package:swissdent/managers/api_manager.dart';

/// Репозиторий для работы с запросами авторизации и логина
class SignInRepository {
  final ApiManager apiManager;

  SignInRepository({
    this.apiManager,
  });

  ///Запрос кода для телефона
  ///phone - номер телефона в формате "+*(***)***-**-**"
  Future<RegisterCode> register(String phone) async {
    final response = await apiManager.post(
      ///todo поменять на реальный апи
      registerUrlTest,
      data: registerRequestBodyToJson(
        RegisterRequestBody(phone: phone),
      ),
    );

    return RegisterCode.fromJson(response.result);
  }

  ///Потверждение кода
  ///phone - номер телефона "+*(***)***-**-**"
  ///сщву - код подтверждения "* * * *"
  Future<bool> confirmCode(String phone, String code) async {
    final response = await apiManager.post(
      ///todo поменять на реальный апи
      confirmCodeUrlTest,
      data: confirmCodeRequestBodyToJson(
        ConfirmCodeRequestBody(
          phone: phone,
          code: _hashCode(code),
        ),
      ),
    );

    if (!response.error) return true;

    return false;
  }

  ///Авторизация
  ///phone - номер телефона "+*(***)***-**-**"
  ///password - пароль
  Future<Token> authorization(String phone, String password) async {
    final response = await apiManager.post(
      ///todo поменять на реальный апи
      authorizationUrlTest,
      data: authorizationRequestBodyToJson(
        AuthorizationRequestBody(phone: phone, password: _hashCode(password)),
      ),
    );

    final token = Token.fromJson(response.result);
    if (!response.error) {
      _writeToken(token.token);
    }

    return token;
  }

  String _hashCode(String password) {
    var bytes = utf8.encode(password); // data being hashed
    var digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<String> readToken() async {
    final storage = new FlutterSecureStorage();
    final token = await storage.read(key: tokenStorageKey);

    return token;
  }

  Future _writeToken(String token) async {
    final storage = new FlutterSecureStorage();
    await storage.write(key: tokenStorageKey, value: token);
  }
}
