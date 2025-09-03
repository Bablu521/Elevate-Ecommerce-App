import 'package:dio/dio.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/login_requests/login_request.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/profile_request/change_password_request/change_password_request.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/profile_request/update_profile_info_request/update_profile_info_request.dart';
import 'package:elevate_ecommerce_app/api/models/responses/login_response/login_response_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/profile/change_password_response/change_password_response_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/profile/profile_info_response/profile_info_response_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/profile/update_profile_info_response/update_profile_info_response_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/profile/upload_image_response/upload_image_response_dto.dart';
import 'package:elevate_ecommerce_app/core/constants/const_keys.dart';
import 'package:elevate_ecommerce_app/core/constants/end_points.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
part 'api_client.g.dart';

@injectable
@RestApi()
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;
  @POST(Endpoints.signIn)
  Future<LoginResponseDto> login(@Body() LoginRequestModel loginRequestModel);
  @PATCH(Endpoints.changePassword)
  Future<ChangePasswordResponseDto> changePassword(
    @Body() ChangePasswordRequest request,
  );
  @GET(Endpoints.profileData)
  Future<ProfileInfoResponseDto> getProfileData();
  @PUT(Endpoints.editProfileData)
  Future<UpdateProfileInfoResponseDto> updateProfileData(
    @Body() UpdateProfileInfoRequest request,
  );
  @PUT(Endpoints.uploadProfileImage)
  @MultiPart()
  Future<UploadImageResponseDto> uploadImageProfile(
    @Part(name: ConstKeys.queryPhoto) MultipartFile photo,
  );
}
