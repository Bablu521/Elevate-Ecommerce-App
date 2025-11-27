import 'package:elevate_ecommerce_app/domin/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

import '../../core/api_result/api_result.dart';
import '../entities/auth/request/verify_reset_request_entity.dart';
import '../entities/auth/response/verify_reset_entity.dart';

@injectable
class VerifyResetCodeUseCase {
  final AuthRepo _authRepo;

  VerifyResetCodeUseCase(this._authRepo);

  Future<ApiResult<VerifyResetEntity>> call(VerifyResetRequestEntity request) async {
    return await _authRepo.verifyResetCode(request);
  }
}
