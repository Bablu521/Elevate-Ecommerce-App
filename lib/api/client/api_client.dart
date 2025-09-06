import 'package:dio/dio.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/register_request_dto/register_request_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/register_response_dto/register_response_dto.dart';
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
import 'package:elevate_ecommerce_app/api/models/requestes/add_product_to_cart_request_dto/add_product_to_cart_request_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/cart_response_dto/cart_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../models/responses/auth/profile/edit_profile.dart';
part 'api_client.g.dart';

@injectable
@RestApi()
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @GET(Endpoints.cart)
  Future<CartResponseDto> getLoggedUserCart();

  @POST(Endpoints.cart)
  Future<CartResponseDto> addProductToCart(
    @Body() AddProductToCartRequestDto addProductToCartRequestDto
  );

  @DELETE('${Endpoints.cart}/{id}')
  Future<CartResponseDto> deleteSpecificCartItem(@Path("id") String productId);

  @DELETE(Endpoints.cart)
  Future<CartResponseDto> clearUserCart();


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
