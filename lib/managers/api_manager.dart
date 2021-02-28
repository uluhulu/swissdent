import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as security;
import 'package:swissdent/constants/keys.dart';
import 'package:swissdent/constants/url.dart';
import 'package:swissdent/data/model/base_response.dart';

class ApiManager {
  static Dio _dio;

  ApiManager() {
    _init();
  }

  void _init() {
    _dio = new Dio(_defaultOption());

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options) {
          print("запрос ${options.path}");
          return options;
        },
        onResponse: (Response response) {
          return response;
        },
        onError: (DioError error) async {
          // if (error.response?.statusCode == 401) {
          //   _dio.interceptors.requestLock.lock();
          //   _dio.interceptors.responseLock.lock();
          //
          //   RequestOptions options = error.response.request;
          //
          //   /// todo сделать разлогин и очистку токена
          //
          // }
        },
      ),
    );
  }

  /// Reset configuration information
  void resetConfig(BaseOptions option) {
    if (option != null) {
      _dio.options = option;
    }
  }

  /// Default basic configuration
  BaseOptions _defaultOption() {
    BaseOptions option = BaseOptions().merge();
    option.baseUrl = baseUrl;
    option.connectTimeout = 1000 * 5;
    option.receiveTimeout = 1000 * 5;
    option.sendTimeout = 1000 * 5;

    return option;
  }

  /// GET
  Future<BaseResponse> get(
    String path, {
    Map<String, dynamic> queryParameters,
    Options options,
  }) async {
    try {
      Response responseJson = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: await _checkOptions('GET', options),
      );

      final response = BaseResponse.fromJson(responseJson.data);
      if (!response.error) {
        return response;
      }

      throw Exception("request error: $response.error");
    } catch (error, stacktrace) {
      print('post stacktrace $stacktrace');
      throw Exception("request error: $error, stacktrace: $stacktrace");
    }
  }

  /// POST
  Future<BaseResponse> post(
    String path, {
    data,
    Options options,
  }) async {
    try {
      Response responseJson = await _dio.post(
        path,
        data: data,
        options: await _checkOptions('POST', options),
      );
      final response = BaseResponse.fromJson(responseJson.data);

      return response;
    } catch (e) {
      throw Exception('Ошибка post-запроса: $e');
    }
  }

  /// PATCH
  Future<BaseResponse> patch(
    String path, {
    data,
    Options options,
  }) async {
    try {
      Response responseJson = await _dio.patch(
        path,
        data: data,
        options: await _checkOptions('PATCH', options),
      );
      final response = BaseResponse.fromJson(responseJson.data);
      if (!response.error) {
        return response;
      }
      throw Exception("request error: $response.error");
    } catch (error, stacktrace) {
      print('patch stacktrace $stacktrace');
      throw Exception("request error: $error, stacktrace: $stacktrace");
    }
  }

  /// check Options.
  Future<Options> _checkOptions(
    String method,
    Options options,
  ) async {
    if (options == null) {
      Map<String, dynamic> headers = {};

      String token = await _readToken();
      print("токен ${token}");
      if (token != null) {
        headers['Authorization'] = "Bearer " + token;
      }

      options = Options(
        method: method,
        headers: headers,
      );
    }

    return options;
  }

  Future<String> _readToken() async {
    final storage = new security.FlutterSecureStorage();
    final token = await storage.read(key: tokenStorageKey);

    return token;
  }
}
