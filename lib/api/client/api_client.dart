import 'package:dio/dio.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/address_request_dto/address_request_dto.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/auth/forget_password_request.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/auth/reset_password_request.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/auth/verify_reset_request.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/login_requests/login_request.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/register_request_dto/register_request_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/addresses_response_dto/address_response_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/addresses_response_dto/addresses_response_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/auth/forget_password_response.dart';
import 'package:elevate_ecommerce_app/api/models/responses/auth/reset_password_response.dart';
import 'package:elevate_ecommerce_app/api/models/responses/auth/verify_reset_response.dart';
import 'package:elevate_ecommerce_app/api/models/responses/best_seller/best_seller_response_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/categories/categories_response.dart';
import 'package:elevate_ecommerce_app/api/models/responses/login_response/login_response_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/occasions_reponse_dto/occasions_reponse_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/products_reponse_dto/products_reponse_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/register_response_dto/register_response_dto.dart';
import 'package:elevate_ecommerce_app/core/constants/end_points.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/add_product_to_cart_request_dto/add_product_to_cart_request_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/cart_response_dto/cart_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../models/responses/home_response_dto/home_response_dto.dart';

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

  @POST(Endpoints.register)
  Future<RegisterResponseDto> register(
      @Body() RegisterRequestDto registerRequestDto,
      );

  @POST(Endpoints.signIn)
  Future<LoginResponseDto> login(@Body() LoginRequestModel loginRequestModel);

  @POST(Endpoints.forgetPassword)
  Future<ForgetPasswordResponse> forgetPassword(
      @Body() ForgetPasswordRequest body,
      );

  @POST(Endpoints.verifyReset)
  Future<VerifyResetResponse> verifyResetCode(@Body() VerifyResetRequest body);

  @PUT(Endpoints.resetPassword)
  Future<ResetPasswordResponse> resetPassword(
      @Body() ResetPasswordRequest body,
      );

  @GET(Endpoints.occasions)
  Future<OccasionsReponseDto> getAllOccasions();

  @GET(Endpoints.products)
  Future<ProductsReponseDto> getProductsByOccasion(
      @Query(Endpoints.occasionQuery) String occasionId,
      );

  @GET(Endpoints.products)
  Future<ProductsReponseDto> getProductsByCategory(
      @Query(Endpoints.categoryQuery) String categoryId,
      );

  @GET(Endpoints.products)
  Future<ProductsReponseDto> getAllProducts();



  @GET(Endpoints.categories)
  Future<CategoriesResponse> getAllCategories();

  @GET(Endpoints.bestSeller)
  Future<BestSellerResponseDto> getBestSeller();


  @GET(Endpoints.address)
  Future<AddressesResponseDto> getLoggedUserAddresses();

  @PATCH(Endpoints.address)
  Future<AddressResponseDto> addAddress(
      @Body() AddressRequestDto addressRequestDto,
      );

  @PATCH('${Endpoints.address}/{id}')
  Future<AddressesResponseDto> updateAddress(
      @Body() AddressRequestDto addressRequestDto,
      @Path("id") String addressId,
      );

  @DELETE('${Endpoints.address}/{id}')
  Future<AddressResponseDto> removeAddress(@Path("id") String addressId);

  @GET(Endpoints.home)
  Future<HomeDto>getHome();
}
