import 'package:dio/dio.dart';

import '../../constants/app_text.dart';

class ResponseException {
  const ResponseException({this.statusCode, this.message, this.error});

  final num? statusCode;
  final String? message;
  final String? error;

  static ResponseException empty() => const ResponseException(
    statusCode: 0,
    message: AppText.noResponseReceivedMessage,
    error: "",
  );

  factory ResponseException.handleException({required Response? response}) {
    if (response != null && response.data is Map<String, dynamic>) {
      final data = response.data as Map<String, dynamic>;
      return ResponseException(
        statusCode: data['statusCode'] ?? 0,
        message: data['message'] ?? AppText.anUnknownErrorOccurred,
        error: data['error'] ?? AppText.anUnknownErrorOccurred,
      );
    } else {
      return empty();
    }
  }
}
