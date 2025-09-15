import 'package:elevate_ecommerce_app/api/models/requestes/auth/forget_password_request.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/request/forget_password_request_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/response/forget_password_entity.dart';

import '../../../domin/entities/auth/request/reset_password_request_entity.dart';
import '../../../domin/entities/auth/request/verify_reset_request_entity.dart';
import '../../../domin/entities/auth/response/reset_password_entity.dart';
import '../../../domin/entities/auth/response/verify_reset_entity.dart';
import '../../models/requestes/auth/reset_password_request.dart';
import '../../models/requestes/auth/verify_reset_request.dart';
import '../../models/responses/auth/forget_password_response.dart';
import '../../models/responses/auth/reset_password_response.dart';
import '../../models/responses/auth/verify_reset_response.dart';

extension ForgetPasswordMapper on ForgetPasswordResponse {
  ForgetPasswordEntity toEntity() {
    return ForgetPasswordEntity(message: message, info: info);
  }
}

extension ForgetPasswordRequestMapper on ForgetPasswordRequestEntity {
  ForgetPasswordRequest fromDomain() {
    return ForgetPasswordRequest(email: email);
  }
}

extension ResetPasswordMapper on ResetPasswordResponse {
  ResetPasswordEntity toEntity() {
    return ResetPasswordEntity(message: message);
  }
}

extension ResetPasswordRequestMapper on ResetPasswordRequestEntity {
  ResetPasswordRequest fromDomain() {
    return ResetPasswordRequest(email: email, newPassword: newPassword);
  }
}

extension VerifyResetMapper on VerifyResetResponse {
  VerifyResetEntity toEntity() {
    return VerifyResetEntity(status: status);
  }
}

extension VerifyResetRequestMapper on VerifyResetRequestEntity {
  VerifyResetRequest fromDomain() {
    return VerifyResetRequest(resetCode: resetCode);
  }
}
