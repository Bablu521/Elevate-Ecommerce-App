
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';

import '../../../domin/models/response/edit_profile.dart';
import '../../../domin/models/response/logout_entity.dart';

abstract class EditProfileRemoteDataSource{
  Future<ApiResult<EditProfileEntity>> editProfile();
  Future<ApiResult<LogOutEntity>> logOut();

}