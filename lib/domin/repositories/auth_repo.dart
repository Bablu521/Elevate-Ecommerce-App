import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';

import '../entities/auth/request/forget_password_request_entity.dart';
import '../entities/auth/request/reset_password_request_entity.dart';
import '../entities/auth/request/verify_reset_request_entity.dart';
import '../entities/auth/response/forget_password_entity.dart';
import '../entities/auth/response/reset_password_entity.dart';
import '../entities/auth/response/verify_reset_entity.dart';

abstract interface class AuthRepo {
  Future<ApiResult<ForgetPasswordEntity>> forgetPassword(
    ForgetPasswordRequestEntity request,
  );

  Future<ApiResult<VerifyResetEntity>> verifyResetCode(
    VerifyResetRequestEntity request,
  );

  Future<ApiResult<ResetPasswordEntity>> resetPassword(
    ResetPasswordRequestEntity request,
  );
}
