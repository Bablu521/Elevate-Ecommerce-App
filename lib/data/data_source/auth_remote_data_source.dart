import 'package:elevate_ecommerce_app/api/models/requestes/login_requests/login_request.dart';
import 'package:elevate_ecommerce_app/api/models/responses/login_response/login_response_dto.dart';

abstract interface class AuthRemoteDataSource {
  Future<LoginResponseDto> login({required LoginRequestModel loginRequest});
}
