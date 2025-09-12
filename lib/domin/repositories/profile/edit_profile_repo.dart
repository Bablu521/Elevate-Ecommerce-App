
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/models/response/edit_profile.dart';
import 'package:elevate_ecommerce_app/domin/models/response/logout_entity.dart';

abstract class EditProfileRepo{
  Future<ApiResult<EditProfileEntity>> editProfile();

  Future<ApiResult<LogOutEntity>> logOut();
}