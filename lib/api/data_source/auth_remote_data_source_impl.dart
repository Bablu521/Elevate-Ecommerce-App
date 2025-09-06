import 'package:dio/src/multipart_file.dart';
import 'package:elevate_ecommerce_app/api/client/api_client.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/profile_request/change_password_request/change_password_request.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/profile_request/update_profile_info_request/update_profile_info_request.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/register_request_dto/register_request_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/profile/change_password_response/change_password_response_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/profile/profile_info_response/profile_info_response_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/profile/update_profile_info_response/update_profile_info_response_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/profile/upload_image_response/upload_image_response_dto.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/data/data_source/auth_remote_data_source.dart';
import 'package:elevate_ecommerce_app/domin/entities/register_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/register_request_entity.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/login_requests/login_request.dart';
import 'package:elevate_ecommerce_app/api/models/responses/login_response/login_response_dto.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient _apiClient;
  const AuthRemoteDataSourceImpl(this._apiClient);

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
  Future<ChangePasswordResponseDto> changeUserPassword({
    required ChangePasswordRequest request,
  }) async {
    return await _apiClient.changePassword(request);
  }

  @override
  Future<ProfileInfoResponseDto> getProfileInfo() async {
    return await _apiClient.getProfileData();
  }

  @override
  Future<UpdateProfileInfoResponseDto> updateProfileInfo({
    required UpdateProfileInfoRequest request,
  }) async {
    return await _apiClient.updateProfileData(request);
  }

  @override
  Future<UploadImageResponseDto> uploadProfileImage({
    required MultipartFile request,
  }) async {
    return await _apiClient.uploadImageProfile(request);
  }
}
