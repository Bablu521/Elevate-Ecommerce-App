import 'package:elevate_ecommerce_app/api/models/requestes/login_requests/login_request.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/login_entity.dart';
import 'package:elevate_ecommerce_app/domin/repositories/auth_repo.dart';

class LoginUseCase {
  final AuthRepo _authRepo;

  LoginUseCase(this._authRepo);
  Future<ApiResult<LoginEntity>> call({
    required LoginRequestModel requestModel,
  }) async {
    return await _authRepo.login(loginRequestModel: requestModel);
  }
}
