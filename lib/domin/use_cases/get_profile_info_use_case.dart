import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/profile_info_entity.dart';
import 'package:elevate_ecommerce_app/domin/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetProfileInfoUseCase {
  final AuthRepo _authRepo;

  GetProfileInfoUseCase(this._authRepo);
  Future<ApiResult<ProfileInfoEntity>> call() async {
    return await _authRepo.getProfileInfo();
  }
}
