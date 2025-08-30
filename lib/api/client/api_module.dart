import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';


@module
abstract class ApiModule {
  @singleton
  Dio provideDio() {
    var dio = Dio(
      BaseOptions(
        baseUrl: "https://flower.elevateegy.com/api/v1/",
        receiveDataWhenStatusError: true,
        receiveTimeout: const Duration(seconds: 20),
        connectTimeout: const Duration(seconds: 20),
      ),
    );
    // dio.interceptors.add(
    //   PrettyDioLogger(
    //     requestHeader: true,
    //     requestBody: true,
    //     responseBody: true,
    //     responseHeader: false,
    //     error: true,
    //     compact: true,
    //     maxWidth: 90,
    //     enabled: kDebugMode,
    //   ),
    // );
    return dio;
  }
}
