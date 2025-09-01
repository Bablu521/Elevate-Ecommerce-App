import 'package:dio/dio.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/add_product_to_cart_request_dto/add_product_to_cart_request_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/cart_response_dto/cart_response_dto.dart';
import 'package:elevate_ecommerce_app/core/constants/end_points.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
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
}
