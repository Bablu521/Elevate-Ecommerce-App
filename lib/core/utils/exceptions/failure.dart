
import 'package:elevate_ecommerce_app/core/utils/exceptions/response_exception.dart';

abstract class Failure {
  const Failure({required this.errorMessage, this.responseException});
  final String errorMessage;
  final ResponseException? responseException;
}
