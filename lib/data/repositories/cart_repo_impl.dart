import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/data/data_source/cart_remote_data_source.dart';
import 'package:elevate_ecommerce_app/domin/entities/cart_response_entity/cart_response_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/add_product_to_cart_request_entity.dart';
import 'package:elevate_ecommerce_app/domin/repositories/cart_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRepo)
class CartRepoImpl implements CartRepo {
  final CartRemoteDataSource _cartRemoteDataSource;
  const CartRepoImpl(this._cartRemoteDataSource);

  @override
  Future<ApiResult<CartResponseEntity>> getLoggedUserCart() {
    return _cartRemoteDataSource.getLoggedUserCart();
  }

  @override
  Future<ApiResult<CartResponseEntity>> addProductToCart(
    AddProductToCartRequestEntity addProductToCartRequestEntity,
  ) {
    return _cartRemoteDataSource.addProductToCart(
      addProductToCartRequestEntity,
    );
  }

  @override
  Future<ApiResult<CartResponseEntity>> deleteSpecificCartItem(
    String productId,
  ) {
    return _cartRemoteDataSource.deleteSpecificCartItem(productId);
  }

  @override
  Future<ApiResult<CartResponseEntity>> clearUserCart() {
    return _cartRemoteDataSource.clearUserCart();
  }
}
