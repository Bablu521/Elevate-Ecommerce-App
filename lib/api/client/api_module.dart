import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../core/utils/token_storage/token_storage.dart';

@module
abstract class ApiModule {
  @singleton
  Dio provideDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: "https://flower.elevateegy.com/",
        receiveDataWhenStatusError: true,
        receiveTimeout: const Duration(seconds: 20),
        connectTimeout: const Duration(seconds: 20),
      ),
    );
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
      ),
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final String? token = await TokenStorage.getToken();
         var token1= "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiNjc4YTc4M2QzYzM3OTc0OTI3NDdjOGU2Iiwicm9sZSI6InVzZXIiLCJpYXQiOjE3MzcxMjc5OTd9.ey-sIWm8Z9QpiUNEfK5U-Ma5lzB2NxI7-DbKZfH1wfM";
          options.headers["Authorization"] = "Bearer $token1";

          // if (token != null && token.isNotEmpty) {
          // }
          return handler.next(options);
        },
      ),
    );
    return dio;
  }
}
