
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';

import '../../../domin/models/response/editprofile.dart';

abstract class EditProfileRemoteDataSource{
  Future<ApiResult<EditProfileEntity>> editProfile();
}