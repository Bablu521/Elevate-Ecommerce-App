import 'package:elevate_ecommerce_app/api/client/api_client.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/login_requests/login_request.dart';
import 'package:elevate_ecommerce_app/api/models/responses/login_response/login_response_dto.dart';
import 'package:elevate_ecommerce_app/api/client/api_client.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/data/data_source/auth_remote_data_source.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/response/forget_password_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/response/reset_password_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domin/entities/auth/request/forget_password_request_entity.dart';
import '../../domin/entities/auth/request/reset_password_request_entity.dart';
import '../../domin/entities/auth/request/verify_reset_request_entity.dart';
import '../../domin/entities/auth/response/verify_reset_entity.dart';
import '../mapper/auth/forget_password_mapper.dart';
import '../mapper/auth/reset_password_mapper.dart';
import '../mapper/auth/verify_reset_mapper.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient _apiClient;

  AuthRemoteDataSourceImpl(this._apiClient);
  @override
  Future<LoginResponseDto> login({
    required LoginRequestModel loginRequest,
  }) async {
    return await _apiClient.login(loginRequest);
  }
  
  @override
  Future<ApiResult<RegisterEntity>> register(
    RegisterRequestEntity registerRequestEntity,
  ) async {
    try {
      var response = await _apiClient.register(
        RegisterRequestDto.fromDomain(registerRequestEntity),
      );
      return ApiSuccessResult(response.user!.toRegisterEntity());
    } catch (e) {
      return ApiErrorResult(e);
    }
  }
  @override
  Future<ApiResult<ForgetPasswordEntity>> forgetPassword(
    ForgetPasswordRequestEntity request,
  ) async {
    try {
      final response = await _apiClient.forgetPassword(
        ForgetPasswordMapper.fromDomain(request),
      );
      return ApiSuccessResult(ForgetPasswordMapper.fromResponse(response));
    } catch (e) {
      return ApiErrorResult(e);
    }
  }

  @override
  Future<ApiResult<ResetPasswordEntity>> resetPassword(
    ResetPasswordRequestEntity request,
  ) async {
    try {
      final response = await _apiClient.resetPassword(
        ResetPasswordMapper.fromDomain(request),
      );
      return ApiSuccessResult(ResetPasswordMapper.fromResponse(response));
    } catch (e) {
      return ApiErrorResult(e);
    }
  }

  @override
  Future<ApiResult<VerifyResetEntity>> verifyResetCode(
    VerifyResetRequestEntity request,
  ) async {
    try {
      final response = await _apiClient.verifyResetCode(
        VerifyResetMapper.fromDomain(request),
      );
      return ApiSuccessResult(VerifyResetMapper.fromResponse(response));
    } catch (e) {
      return ApiErrorResult(e);
    }
  }
}
