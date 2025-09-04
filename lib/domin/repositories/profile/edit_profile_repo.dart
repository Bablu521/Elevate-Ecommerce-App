
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/models/response/editprofile.dart';

abstract class EditProfileRepo{
  Future<ApiResult<EditProfileEntity>> editProfile();
}