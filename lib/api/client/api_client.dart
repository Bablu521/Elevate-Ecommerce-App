import 'package:dio/dio.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/auth/forget_password_request.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/auth/reset_password_request.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/auth/verify_reset_request.dart';
import 'package:elevate_ecommerce_app/api/models/responses/auth/reset_password_response.dart';
import 'package:elevate_ecommerce_app/api/models/responses/auth/verify_reset_response.dart';
import 'package:elevate_ecommerce_app/core/constants/api_end_points.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../models/responses/auth/forget_password_response.dart';

part 'api_client.g.dart';

@injectable
@RestApi()
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @POST(ApiEndPoints.forgetPassword)
  Future<ForgetPasswordResponse> forgetPassword(
    @Body() ForgetPasswordRequest body,
  );

  @POST(ApiEndPoints.verifyReset)
  Future<VerifyResetResponse> verifyResetCode(@Body() VerifyResetRequest body);

  @PUT(ApiEndPoints.resetPassword)
  Future<ResetPasswordResponse> resetPassword(@Body() ResetPasswordRequest body);
}
