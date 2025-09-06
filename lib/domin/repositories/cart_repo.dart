import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/cart_response_entity/cart_response_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/add_product_to_cart_request_entity.dart';

abstract interface class CartRepo {
  Future<ApiResult<CartResponseEntity>> getLoggedUserCart();

  Future<ApiResult<CartResponseEntity>> addProductToCart(
    AddProductToCartRequestEntity addProductToCartRequestEntity,
  );

  Future<ApiResult<CartResponseEntity>> deleteSpecificCartItem(
    String productId,
  );

  Future<ApiResult<CartResponseEntity>> clearUserCart();
}