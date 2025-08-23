import 'package:elevate_ecommerce_app/api/models/requestes/auth/forget_password_request.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/response/forget_password_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/request/forget_password_request_entity.dart';

import '../../models/responses/auth/forget_password_response.dart';

abstract class ForgetPasswordMapper{
  static ForgetPasswordEntity fromResponse(ForgetPasswordResponse response){
    return ForgetPasswordEntity(
      message: response.message,
      info: response.info,
    );
  }

  static ForgetPasswordRequest fromDomain(ForgetPasswordRequestEntity request){
    return ForgetPasswordRequest(
      email: request.email
    );
  }
}