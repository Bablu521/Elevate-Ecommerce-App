
import 'package:dio/dio.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/register_request_dto/register_request_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/auth/profile/logout.dart';
import 'package:elevate_ecommerce_app/api/models/responses/register_response_dto/register_response_dto.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/login_requests/login_request.dart';
import 'package:elevate_ecommerce_app/api/models/responses/login_response/login_response_dto.dart';
import 'package:elevate_ecommerce_app/core/constants/end_points.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../models/responses/auth/profile/edit_profile.dart';
part 'api_client.g.dart';

@injectable
@RestApi()
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @GET(Endpoints.logOut)
  Future<LogOutDto> logOut(
      @Header("Authorization") String token,
      );

  @PUT(Endpoints.editProfile)
  Future<EditProfileDto> editProfile(
      @Header("Authorization") String token,
      );

  @POST(Endpoints.register)
  Future<RegisterResponseDto> register(
      @Body() RegisterRequestDto registerRequestDto,
      );

  @POST(Endpoints.signIn)
  Future<LoginResponseDto> login(@Body() LoginRequestModel loginRequestModel);

}
