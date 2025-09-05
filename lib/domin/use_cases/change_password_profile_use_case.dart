import 'package:elevate_ecommerce_app/api/models/requestes/profile_request/change_password_request/change_password_request.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/change_password_entity.dart';
import 'package:elevate_ecommerce_app/domin/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ChangePasswordProfileUseCase {
  final AuthRepo _authRepo;

  ChangePasswordProfileUseCase(this._authRepo);
  Future<ApiResult<ChangePasswordEntity>> call(
    ChangePasswordRequest pram,
  ) async {
    return await _authRepo.changePassword(request: pram);
  }
}
