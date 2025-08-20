import 'package:elevate_ecommerce_app/api/client/api_client.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/register_request_dto/register_request_dto.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/data/data_source/auth_remote_data_source.dart';
import 'package:elevate_ecommerce_app/domin/entities/register_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/register_request_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient _apiClient;
  const AuthRemoteDataSourceImpl(this._apiClient);

  @override
  Future<ApiResult<RegisterEntity>> register(
    RegisterRequestEntity registerRequestEntity,
  ) async {
    try {
      var response = await _apiClient.register(
        RegisterRequestDto.fromDomain(registerRequestEntity),
      );
      return ApiSuccessResult(response.user!.toRegisterEntity());
    } catch (e) {
      return ApiErrorResult(e);
    }
  }
}
