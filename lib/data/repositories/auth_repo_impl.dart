import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/data/data_source/auth_remote_data_source.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/response/forget_password_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/response/reset_password_entity.dart';
import 'package:elevate_ecommerce_app/domin/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

import '../../domin/entities/auth/request/forget_password_request_entity.dart';
import '../../domin/entities/auth/request/reset_password_request_entity.dart';
import '../../domin/entities/auth/request/verify_reset_request_entity.dart';
import '../../domin/entities/auth/response/verify_reset_entity.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepoImpl(this._authRemoteDataSource);

  @override
  Future<ApiResult<ForgetPasswordEntity>> forgetPassword(
    ForgetPasswordRequestEntity request,
  ) {
    return _authRemoteDataSource.forgetPassword(request);
  }

  @override
  Future<ApiResult<ResetPasswordEntity>> resetPassword(
    ResetPasswordRequestEntity request,
  ) {
    return _authRemoteDataSource.resetPassword(request);
  }

  @override
  Future<ApiResult<VerifyResetEntity>> verifyResetCode(
    VerifyResetRequestEntity request,
  ) {
    return _authRemoteDataSource.verifyResetCode(request);
  }
}
