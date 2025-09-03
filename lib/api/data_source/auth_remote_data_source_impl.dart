import 'package:elevate_ecommerce_app/api/client/api_client.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/login_requests/login_request.dart';
import 'package:elevate_ecommerce_app/api/models/responses/login_response/login_response_dto.dart';
import 'package:elevate_ecommerce_app/data/data_source/auth_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient _apiClient;

  AuthRemoteDataSourceImpl(this._apiClient);
  @override
  Future<LoginResponseDto> login({
    required LoginRequestModel loginRequest,
  }) async {
    return await _apiClient.login(loginRequest);
  }
}
