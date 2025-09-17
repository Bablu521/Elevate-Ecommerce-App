import 'package:elevate_ecommerce_app/api/models/requestes/profile_request/update_profile_info_request/update_profile_info_request.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/update_profile_entity.dart';
import 'package:elevate_ecommerce_app/domin/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdateProfileInfoUseCase {
  final AuthRepo _authRepo;

  UpdateProfileInfoUseCase(this._authRepo);
  Future<ApiResult<UpdateProfileEntity>> call(
    UpdateProfileInfoRequest pram,
  ) async {
    return await _authRepo.updateProfileInfo(request: pram);
  }
}
