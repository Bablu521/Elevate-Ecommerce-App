
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';

import '../../../domin/models/response/editprofile.dart';
import '../../../domin/models/response/logOutEntity.dart';

abstract class EditProfileRemoteDataSource{
  Future<ApiResult<EditProfileEntity>> editProfile();
  Future<ApiResult<LogOutEntity>> logOut();

}