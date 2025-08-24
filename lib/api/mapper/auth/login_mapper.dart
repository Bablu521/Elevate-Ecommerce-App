import 'package:elevate_ecommerce_app/api/models/responses/login_response/login_response_dto.dart';
import 'package:elevate_ecommerce_app/domin/entities/login_entity.dart';

abstract class LoginMapper {
  static LoginEntity fromResponse({required LoginResponseDto loginResponse}) {
    return LoginEntity(
      userToken: loginResponse.token,
      message: loginResponse.message,
    );
  }
}
