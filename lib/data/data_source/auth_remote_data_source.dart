import '../../core/api_result/api_result.dart';
import '../../domin/entities/auth/request/forget_password_request_entity.dart';
import '../../domin/entities/auth/request/reset_password_request_entity.dart';
import '../../domin/entities/auth/request/verify_reset_request_entity.dart';
import '../../domin/entities/auth/response/forget_password_entity.dart';
import '../../domin/entities/auth/response/reset_password_entity.dart';
import '../../domin/entities/auth/response/verify_reset_entity.dart';

abstract interface class AuthRemoteDataSource {
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
