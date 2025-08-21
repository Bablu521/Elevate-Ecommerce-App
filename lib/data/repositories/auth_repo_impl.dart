import 'package:elevate_ecommerce_app/api/models/requestes/login_requests/login_request.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/data/data_source/auth_remote_data_source.dart';
import 'package:elevate_ecommerce_app/data/mapper/login/login_mapper.dart';
import 'package:elevate_ecommerce_app/domin/entities/login_entity.dart';
import 'package:elevate_ecommerce_app/domin/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepoImpl({required this.authRemoteDataSource});

  @override
  Future<ApiResult<LoginEntity>> login({
    required LoginRequestModel loginRequestModel,
  }) async {
    try {
      final response = await authRemoteDataSource.login(
        loginRequest: loginRequestModel,
      );
      return ApiSuccessResult<LoginEntity>(
        LoginMapper.fromResponse(loginResponse: response),
      );
    } catch (e) {
      return ApiErrorResult<LoginEntity>(e);
    }
  }
}
