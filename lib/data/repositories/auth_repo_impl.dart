import 'dart:developer';
import 'package:elevate_ecommerce_app/api/models/requestes/login_requests/login_request.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/core/constants/const_keys.dart';
import 'package:elevate_ecommerce_app/data/data_source/auth_local_data_source.dart';
import 'package:elevate_ecommerce_app/data/data_source/auth_remote_data_source.dart';
import 'package:elevate_ecommerce_app/api/mapper/auth/login_mapper.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/request/forget_password_request_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/request/reset_password_request_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/request/verify_reset_request_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/response/verify_reset_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/login_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/response/forget_password_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/response/reset_password_entity.dart';
import 'package:elevate_ecommerce_app/domin/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;
  AuthRepoImpl(
     this._authRemoteDataSource,
     this._authLocalDataSource,
  );

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
  Future<ApiResult<ForgetPasswordEntity>> forgetPassword(
    ForgetPasswordRequestEntity request,
  ) {
    return _authRemoteDataSource.forgetPassword(request);
  }

  @override
  Future<ApiResult<ResetPasswordEntity>> resetPassword(
    ResetPasswordRequestEntity request,
  ) {
    return _authRemoteDataSource.resetPassword(request);
  }

  @override
  Future<ApiResult<VerifyResetEntity>> verifyResetCode(
    VerifyResetRequestEntity request,
  ) {
    return _authRemoteDataSource.verifyResetCode(request);
  }

  @override
  Future<ApiResult<RegisterEntity>> register(
    RegisterRequestEntity registerRequestEntity,
  ) {
    return _authRemoteDataSource.register(registerRequestEntity);
  }
}
