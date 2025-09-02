import 'package:elevate_ecommerce_app/api/models/requestes/login_requests/login_request.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/login_entity.dart';

abstract interface class AuthRepo {
  Future<ApiResult<LoginEntity>> login({
    required LoginRequestModel loginRequestModel,
  });
  Future<void> guestUserLogin();
  Future<bool> getUserStatus();
  Future<void> userLogout();
}
