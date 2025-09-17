import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/logout_entity.dart';
import 'package:elevate_ecommerce_app/domin/repositories/auth_repo.dart';

import 'package:injectable/injectable.dart';

@injectable
class LogoutUseCase {
  final AuthRepo _authRepo;
  LogoutUseCase(this._authRepo);

  Future<ApiResult<LogoutEntity>> call() async {
    return await _authRepo.logout();
  }
}
