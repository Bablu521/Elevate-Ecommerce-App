import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/register_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/register_request_entity.dart';
import 'package:elevate_ecommerce_app/domin/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUseCase {
  final AuthRepo _authRepo;
  const RegisterUseCase(this._authRepo);

  Future<ApiResult<RegisterEntity>> call(
    RegisterRequestEntity registerRequestEntity,
  ) {
    return _authRepo.register(registerRequestEntity);
  }
}
