import 'package:elevate_ecommerce_app/domin/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

import '../../core/api_result/api_result.dart';
import '../entities/auth/request/forget_password_request_entity.dart';
import '../entities/auth/response/forget_password_entity.dart';

@injectable
class ForgetPasswordUseCase{
  final AuthRepo _authRepo;
  ForgetPasswordUseCase(this._authRepo);

  Future<ApiResult<ForgetPasswordEntity>> call(ForgetPasswordRequestEntity request){
    return _authRepo.forgetPassword(request);
  }
}