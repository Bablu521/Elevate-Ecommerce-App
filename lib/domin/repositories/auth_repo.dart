import 'package:dio/dio.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/profile_request/change_password_request/change_password_request.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/profile_request/update_profile_info_request/update_profile_info_request.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/logout_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/profile_info_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/change_password_entity.dart';
import '../../api/models/requestes/login_requests/login_request.dart';
import '../entities/auth/request/forget_password_request_entity.dart';
import '../entities/auth/request/reset_password_request_entity.dart';
import '../entities/auth/request/verify_reset_request_entity.dart';
import '../entities/auth/response/forget_password_entity.dart';
import '../entities/auth/response/reset_password_entity.dart';
import '../entities/auth/response/verify_reset_entity.dart';
import '../entities/login_entity.dart';
import '../entities/register_entity.dart';
import '../entities/requests/register_request_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/update_profile_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/upload_image_entity.dart';

abstract interface class AuthRepo {
  Future<ApiResult<RegisterEntity>> register(
    RegisterRequestEntity registerRequestEntity,
  );

  Future<ApiResult<LoginEntity>> login({
    required LoginRequestModel loginRequestModel,
  });

  Future<void> guestUserLogin();

  Future<bool> getUserStatus();
  Future<ApiResult<ProfileInfoEntity>> getProfileInfo();
  Future<ApiResult<ChangePasswordEntity>> changePassword({
    required ChangePasswordRequest request,
  });
  Future<ApiResult<UpdateProfileEntity>> updateProfileInfo({
    required UpdateProfileInfoRequest request,
  });
  Future<ApiResult<UploadImageEntity>> uploadImageProfile({
    required MultipartFile photo,
  });
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
