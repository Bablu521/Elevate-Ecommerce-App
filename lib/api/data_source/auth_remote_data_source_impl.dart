import 'package:elevate_ecommerce_app/api/client/api_client.dart';
import 'package:elevate_ecommerce_app/api/mapper/auth/logout_mapper.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/register_request_dto/register_request_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/logout/logout_model.dart';
import 'package:elevate_ecommerce_app/api/models/responses/profile/profile_info_response/profile_info_response_dto.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/data/data_source/auth_remote_data_source.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/response/forget_password_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/response/reset_password_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/logout_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domin/entities/auth/request/forget_password_request_entity.dart';
import '../../domin/entities/auth/request/reset_password_request_entity.dart';
import '../../domin/entities/auth/request/verify_reset_request_entity.dart';
import '../../domin/entities/auth/response/verify_reset_entity.dart';
import '../../domin/entities/register_entity.dart';
import '../../domin/entities/requests/register_request_entity.dart';
import '../mapper/auth/forget_password_mapper.dart';
import '../models/requestes/login_requests/login_request.dart';
import '../models/responses/login_response/login_response_dto.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient _apiClient;

  AuthRemoteDataSourceImpl(this._apiClient);

  @override
  Future<ApiResult<RegisterEntity>> register(
    RegisterRequestEntity registerRequestEntity,
  ) async {
    return safeApiCall(
      () => _apiClient.register(
        RegisterRequestDto.fromDomain(registerRequestEntity),
      ),
      (response) => response.user!.toRegisterEntity(),
    );
  }

  @override
  Future<LoginResponseDto> login({
    required LoginRequestModel loginRequest,
  }) async {
    return await _apiClient.login(loginRequest);
  }

  @override
  Future<ProfileInfoResponseDto> getProfileInfo() async {
    return await _apiClient.getProfileData();
  }

  @override
  Future<ApiResult<ForgetPasswordEntity>> forgetPassword(
    ForgetPasswordRequestEntity request,
  ) async {
    return safeApiCall(
      () => _apiClient.forgetPassword(request.fromDomain()),
      (response) => response.toEntity(),
    );
  }

  @override
  Future<ApiResult<ResetPasswordEntity>> resetPassword(
    ResetPasswordRequestEntity request,
  ) async {
    return safeApiCall(
      () => _apiClient.resetPassword(request.fromDomain()),
      (response) => response.toEntity(),
    );
  }

  @override
  Future<ApiResult<VerifyResetEntity>> verifyResetCode(
    VerifyResetRequestEntity request,
  ) async {
    return safeApiCall(
      () => _apiClient.verifyResetCode(request.fromDomain()),
      (response) => response.toEntity(),
    );
  }

  @override
  Future<ApiResult<LogoutEntity>> logout() async {
    return safeApiCall<LogoutModel, LogoutEntity>(
      () => _apiClient.logout(),
      (response) => response.toEntity(),
    );
  }
}
