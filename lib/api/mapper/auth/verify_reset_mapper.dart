import 'package:elevate_ecommerce_app/domin/entities/auth/response/verify_reset_entity.dart';

import '../../../domin/entities/auth/request/verify_reset_request_entity.dart';
import '../../models/requestes/auth/verify_reset_request.dart';
import '../../models/responses/auth/verify_reset_response.dart';

abstract class VerifyResetMapper {
  static VerifyResetEntity fromResponse(VerifyResetResponse response) {
    return VerifyResetEntity(status: response.status);
  }

  static VerifyResetRequest fromDomain(VerifyResetRequestEntity request) {
    return VerifyResetRequest(resetCode: request.resetCode);
  }
}
