import 'package:dio/dio.dart';
import 'package:elevate_ecommerce_app/core/constants/app_text.dart';
import 'package:elevate_ecommerce_app/core/utils/exceptions/failure.dart';
import 'package:elevate_ecommerce_app/core/utils/exceptions/response_exception.dart';

class DioExceptions extends Failure {
  DioExceptions({required super.errorMessage, super.responseException});

  factory DioExceptions.handleError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return DioExceptions(errorMessage: AppText.connectionTimeout);
        case DioExceptionType.sendTimeout:
          return DioExceptions(errorMessage: AppText.sendTimeout);
        case DioExceptionType.receiveTimeout:
          return DioExceptions(errorMessage: AppText.receiveTimeout);
        case DioExceptionType.badResponse:
          return _handleBadResponse(error.response);
        case DioExceptionType.cancel:
          return DioExceptions(errorMessage: AppText.requestCancelled);
        case DioExceptionType.unknown:
          return DioExceptions(errorMessage: AppText.networkError);
        default:
          return DioExceptions(errorMessage: AppText.unexpectedErrorOccurred);
      }
    } else {
      return DioExceptions(
        errorMessage: "${AppText.unexpectedError} ${error.toString()}",
      );
    }
  }

  static DioExceptions _handleBadResponse(Response? response) {
    if (response == null) {
      return DioExceptions(errorMessage: AppText.noResponseReceivedMessage);
    }
    switch (response.statusCode) {
      case 400:
        return DioExceptions(
          errorMessage: AppText.badRequest,
          responseException: ResponseException.handleException(
            response: response,
          ),
        );
      case 401:
        return DioExceptions(
          errorMessage: AppText.unauthorized,
          responseException: ResponseException.handleException(
            response: response,
          ),
        );
      case 403:
        return DioExceptions(
          errorMessage: AppText.forbidden,
          responseException: ResponseException.handleException(
            response: response,
          ),
        );
      case 404:
        return DioExceptions(
          errorMessage: AppText.resourceNotFound,
          responseException: ResponseException.handleException(
            response: response,
          ),
        );
      case 422:
        return DioExceptions(
          errorMessage: AppText.validationError,
          responseException: ResponseException.handleException(
            response: response,
          ),
        );
      case 429:
        return DioExceptions(
          errorMessage: AppText.manyRequests,
          responseException: ResponseException.handleException(
            response: response,
          ),
        );
      case 500:
        return DioExceptions(
          errorMessage: AppText.internalServerError,
          responseException: ResponseException.handleException(
            response: response,
          ),
        );
      default:
        return DioExceptions(
          errorMessage:
              "${AppText.error} ${response.statusCode}: ${response.statusMessage}",
          responseException: ResponseException.handleException(
            response: response,
          ),
        );
    }
  }
}
