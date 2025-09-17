import 'package:elevate_ecommerce_app/api/models/responses/profile/profile_info_response/profile_info_response_dto.dart';
import 'package:elevate_ecommerce_app/domin/entities/logout_entity.dart';

import '../../api/models/requestes/login_requests/login_request.dart';
import '../../api/models/responses/login_response/login_response_dto.dart';
import '../../core/api_result/api_result.dart';
import '../../domin/entities/auth/request/forget_password_request_entity.dart';
import '../../domin/entities/auth/request/reset_password_request_entity.dart';
import '../../domin/entities/auth/request/verify_reset_request_entity.dart';
import '../../domin/entities/auth/response/forget_password_entity.dart';
import '../../domin/entities/auth/response/reset_password_entity.dart';
import '../../domin/entities/auth/response/verify_reset_entity.dart';
import '../../domin/entities/register_entity.dart';
import '../../domin/entities/requests/register_request_entity.dart';

abstract interface class AuthRemoteDataSource {
  Future<ApiResult<RegisterEntity>> register(
    RegisterRequestEntity registerRequestEntity,
  );

  Future<LoginResponseDto> login({required LoginRequestModel loginRequest});
  Future<ProfileInfoResponseDto> getProfileInfo();
  Future<ApiResult<ForgetPasswordEntity>> forgetPassword(
    ForgetPasswordRequestEntity request,
  );

  Future<ApiResult<VerifyResetEntity>> verifyResetCode(
    VerifyResetRequestEntity request,
  );

  Future<ApiResult<ResetPasswordEntity>> resetPassword(
    ResetPasswordRequestEntity request,
  );
  Future<ApiResult<LogoutEntity>> logout();
}
