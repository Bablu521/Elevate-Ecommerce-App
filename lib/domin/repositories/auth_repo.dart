import 'package:dio/dio.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/profile_request/change_password_request/change_password_request.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/profile_request/update_profile_info_request/update_profile_info_request.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/change_password_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/profile_info_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/register_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/register_request_entity.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/login_requests/login_request.dart';
import 'package:elevate_ecommerce_app/domin/entities/login_entity.dart';
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
}
