import 'package:injectable/injectable.dart';

import '../../core/api_result/api_result.dart';
import '../entities/auth/request/reset_password_request_entity.dart';
import '../entities/auth/response/reset_password_entity.dart';
import '../repositories/auth_repo.dart';

@injectable
class ResetPasswordUseCase {
  final AuthRepo _authRepo;

  ResetPasswordUseCase(this._authRepo);

  Future<ApiResult<ResetPasswordEntity>> call(ResetPasswordRequestEntity request) async {
    return await _authRepo.resetPassword(request);
  }
}
