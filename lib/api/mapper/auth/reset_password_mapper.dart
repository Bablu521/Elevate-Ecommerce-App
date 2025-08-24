import 'package:elevate_ecommerce_app/domin/entities/auth/response/reset_password_entity.dart';

import '../../../domin/entities/auth/request/reset_password_request_entity.dart';
import '../../models/requestes/auth/reset_password_request.dart';
import '../../models/responses/auth/reset_password_response.dart';

abstract class ResetPasswordMapper {
  static ResetPasswordEntity fromResponse(ResetPasswordResponse response) {
    return ResetPasswordEntity(
      message: response.message,
      token: response.token,
    );
  }

  static ResetPasswordRequest fromDomain(ResetPasswordRequestEntity request) {
    return ResetPasswordRequest(
      email: request.email,
      newPassword: request.newPassword,
    );
  }
}
