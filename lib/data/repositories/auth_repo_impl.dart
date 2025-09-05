import 'package:dio/src/multipart_file.dart';
import 'package:elevate_ecommerce_app/api/mapper/auth/profile_mapper.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/profile_request/change_password_request/change_password_request.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/profile_request/update_profile_info_request/update_profile_info_request.dart';
import 'package:elevate_ecommerce_app/api/models/responses/profile/change_password_response/change_password_response_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/profile/profile_info_response/profile_info_response_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/profile/update_profile_info_response/update_profile_info_response_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/profile/upload_image_response/upload_image_response_dto.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/data/data_source/auth_remote_data_source.dart';
import 'package:elevate_ecommerce_app/domin/entities/change_password_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/profile_info_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/register_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/register_request_entity.dart';
import 'dart:developer';
import 'package:elevate_ecommerce_app/api/models/requestes/login_requests/login_request.dart';
import 'package:elevate_ecommerce_app/core/constants/const_keys.dart';
import 'package:elevate_ecommerce_app/data/data_source/auth_local_data_source.dart';
import 'package:elevate_ecommerce_app/api/mapper/auth/login_mapper.dart';
import 'package:elevate_ecommerce_app/domin/entities/login_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/update_profile_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/upload_image_entity.dart';
import 'package:elevate_ecommerce_app/domin/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;
  const AuthRepoImpl(this._authRemoteDataSource, this._authLocalDataSource);

  @override
  Future<ApiResult<RegisterEntity>> register(
    RegisterRequestEntity registerRequestEntity,
  ) {
    return _authRemoteDataSource.register(registerRequestEntity);
  }

  @override
  Future<ApiResult<LoginEntity>> login({
    required LoginRequestModel loginRequestModel,
  }) async {
    try {
      final response = await _authRemoteDataSource.login(
        loginRequest: loginRequestModel,
      );
      await _handleUserInfo(
        rememberMe: loginRequestModel.rememberMe,
        token: response.token,
        userStatus: ConstKeys.kUserLogin,
      );
      return ApiSuccessResult<LoginEntity>(
        LoginMapper.fromResponse(loginResponse: response),
      );
    } catch (e) {
      return ApiErrorResult<LoginEntity>(e);
    }
  }

  Future<void> _handleUserInfo({
    required bool rememberMe,
    required String token,
    required String userStatus,
  }) async {
    try {
      await _authLocalDataSource.saveUserRememberMe(rememberMe: rememberMe);
      await _authLocalDataSource.saveUserToken(token: token);
      await _authLocalDataSource.saveUserStatus(userStatus: userStatus);
    } catch (e, stack) {
      log("Error saving user info locally: $e", stackTrace: stack);
    }
  }

  @override
  Future<void> guestUserLogin() async {
    await _handleUserInfo(
      rememberMe: true,
      token: ConstKeys.kNoToken,
      userStatus: ConstKeys.kUserGuest,
    );
  }

  @override
  Future<bool> getUserStatus() async {
    try {
      return await _authLocalDataSource.getUserStatus();
    } catch (e, stack) {
      log("Error: $e");
      log("Stack trace: $stack");
      return false;
    }
  }

  @override
  Future<ApiResult<ChangePasswordEntity>> changePassword({
    required ChangePasswordRequest request,
  }) {
    return safeApiCall<ChangePasswordResponseDto, ChangePasswordEntity>(
      () async {
        final response = await _authRemoteDataSource.changeUserPassword(
          request: request,
        );
        await _authLocalDataSource.saveUserToken(
          token: response.token ?? "user not have token",
        );
        return response;
      },
      (dto) => ProfileMapper.changePasswordFromResponse(dto),
    );
  }

  @override
  Future<ApiResult<ProfileInfoEntity>> getProfileInfo() async {
    return safeApiCall<ProfileInfoResponseDto, ProfileInfoEntity>(
      () => _authRemoteDataSource.getProfileInfo(),
      (dto) => ProfileMapper.profileFromResponse(dto),
    );
  }

  @override
  Future<ApiResult<UpdateProfileEntity>> updateProfileInfo({
    required UpdateProfileInfoRequest request,
  }) async {
    return safeApiCall<UpdateProfileInfoResponseDto, UpdateProfileEntity>(
      () => _authRemoteDataSource.updateProfileInfo(request: request),
      (dto) => ProfileMapper.updateProfileFromResponse(dto),
    );
  }

  @override
  Future<ApiResult<UploadImageEntity>> uploadImageProfile({
    required MultipartFile photo,
  }) async {
    return safeApiCall<UploadImageResponseDto, UploadImageEntity>(
      () => _authRemoteDataSource.uploadProfileImage(request: photo),
      (dto) => ProfileMapper.uploadImageFromResponse(dto),
    );
  }
}
