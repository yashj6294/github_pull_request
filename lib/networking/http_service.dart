import 'dart:developer';

import 'package:dio/dio.dart';

class HttpService {
  late Dio _dio;

  HttpService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: "https://api.github.com/",
        headers: {
          "Authorization":
              "Bearer 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",
        },
      ),
    );
    initializeInterceptors();
  }

  initializeInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) {
          log(error.message);
          handler.next(error);
        },
        onRequest: (options, handler) {
          log("${options.method} ${options.path}");
          handler.next(options);
        },
        onResponse: (response, handler) {
          handler.next(response);
        },
      ),
    );
  }

  Future<Response> getRequest(String path) async {
    Response? response;
    try {
      response = await _dio.get(path);
    } on DioError catch (e) {
      log(e.message);
      throw Exception(e.message);
    }
    return response;
  }
}
