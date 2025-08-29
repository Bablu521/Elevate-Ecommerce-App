import 'package:dio/dio.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/auth/forget_password_request.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/auth/reset_password_request.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/auth/verify_reset_request.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/register_request_dto/register_request_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/auth/reset_password_response.dart';
import 'package:elevate_ecommerce_app/api/models/responses/auth/verify_reset_response.dart';
import 'package:elevate_ecommerce_app/api/models/responses/home_response_dto/home_response_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/register_response_dto/register_response_dto.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/login_requests/login_request.dart';
import 'package:elevate_ecommerce_app/api/models/responses/login_response/login_response_dto.dart';
import 'package:elevate_ecommerce_app/core/constants/end_points.dart';
import 'package:elevate_ecommerce_app/api/models/responses/occasions_reponse_dto/occasions_reponse_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/products_reponse_dto/products_reponse_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/categories/all_categories_response.dart';
import 'package:elevate_ecommerce_app/api/models/responses/products/all_products_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../models/responses/auth/forget_password_response.dart';

part 'api_client.g.dart';

@injectable
@RestApi()
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @GET(Endpoints.occasions)
  Future<OccasionsReponseDto> getAllOccasions();

  @GET(Endpoints.products)
  Future<ProductsReponseDto> getProductsByOccasion(
    @Query("occasion") String occasionId,
  );

  @GET(Endpoints.products)
  Future<ProductsReponseDto> getProductsByCategory(
    @Query("category") String categoryId,
  );
  @POST(Endpoints.signIn)
  Future<LoginResponseDto> login(@Body() LoginRequestModel loginRequestModel);
  @POST(Endpoints.forgetPassword)
  Future<ForgetPasswordResponse> forgetPassword(
    @Body() ForgetPasswordRequest body,
  );

  @POST(Endpoints.register)
  Future<RegisterResponseDto> register(
    @Body() RegisterRequestDto registerRequestDto,
  );

  @POST(Endpoints.verifyReset)
  Future<VerifyResetResponse> verifyResetCode(@Body() VerifyResetRequest body);

  @PUT(Endpoints.resetPassword)
  Future<ResetPasswordResponse> resetPassword(
    @Body() ResetPasswordRequest body,
  );
  @GET(Endpoints.categories)
  Future<AllCategoriesResponse> getAllCategories();

  @GET(Endpoints.products)
  Future<AllProductsResponse> getAllProducts();
  @GET(Endpoints.home)
  Future<HomeDto>getHome();
}
