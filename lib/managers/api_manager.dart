import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:swissdent/constants/url.dart';

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
          return options;
        },
        onResponse: (Response response) {
          return response;
        },
        onError: (DioError error) async {
          if (error.response?.statusCode == 401) {
            _dio.interceptors.requestLock.lock();
            _dio.interceptors.responseLock.lock();

            RequestOptions options = error.response.request;

            /// возможно понадобится сделать обновление токена

          }
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
    option.connectTimeout = 1000 * 60;
    option.receiveTimeout = 1000 * 60;
    option.sendTimeout = 1000 * 60;
    option.headers = {
      'Accept': 'application/json',
      'Timezone': DateTime.now().timeZoneName
    };
    return option;
  }

  /// GET
  Future get(
    String path, {
    data,
    Options options,
  }) async {
    try {
      Response response = await _dio.post(
        path,
        data: data,
        options: await _checkOptions('GET', options),
      );
      return jsonDecode(response.data);
    } catch (error, stacktrace) {
      print('post stacktrace $stacktrace');
      throw Exception("request error: $error, stacktrace: $stacktrace");
    }
  }

  /// POST
  Future post(
    String path, {
    data,
    Options options,
  }) async {
    try {
      Response response = await _dio.post(
        path,
        data: data,
        options: await _checkOptions('POST', options),
      );
      return jsonDecode(response.data);
    } catch (error, stacktrace) {
      print('post stacktrace $stacktrace');
      throw Exception("request error: $error, stacktrace: $stacktrace");
    }
  }

  /// PATCH
  Future patch(
    String path, {
    data,
    Options options,
  }) async {
    try {
      Response response = await _dio.post(
        path,
        data: data,
        options: await _checkOptions('PATCH', options),
      );
      return jsonDecode(response.data);
    } catch (error, stacktrace) {
      print('post stacktrace $stacktrace');
      throw Exception("request error: $error, stacktrace: $stacktrace");
    }
  }

  /// check Options.
  Future<Options> _checkOptions(method, options) async {
    if (options == null) {
      Map<String, dynamic> headers = {
        'Accept': 'application/json',
      };

      String token = 'todo add real token';
      print(token);
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
}
