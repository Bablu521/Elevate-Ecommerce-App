import 'package:elevate_ecommerce_app/api/client/api_client.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/add_product_to_cart_request_dto/add_product_to_cart_request_dto.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/data/data_source/cart_remote_data_source.dart';
import 'package:elevate_ecommerce_app/domin/entities/cart_response_entity/cart_response_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/add_product_to_cart_request_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final ApiClient _apiClient;
  const CartRemoteDataSourceImpl(this._apiClient);

  @override
  Future<ApiResult<CartResponseEntity>> getLoggedUserCart() async {
    return safeApiCall(
      () => _apiClient.getLoggedUserCart(),
      (response) => response.toCartResponseEntity(),
    );
  }

  @override
  Future<ApiResult<CartResponseEntity>> addProductToCart(
    AddProductToCartRequestEntity addProductToCartRequestEntity,
  ) async {
    return safeApiCall(
      () => _apiClient.addProductToCart(
        AddProductToCartRequestDto.fromDomain(addProductToCartRequestEntity),
      ),
      (response) => response.toCartResponseEntity(),
    );
  }

  @override
  Future<ApiResult<CartResponseEntity>> deleteSpecificCartItem(
    String productId,
  ) async {
    return safeApiCall(
      () => _apiClient.deleteSpecificCartItem(productId),
      (response) => response.toCartResponseEntity(),
    );
  }

  @override
  Future<ApiResult<CartResponseEntity>> clearUserCart() async {
    return safeApiCall(
      () => _apiClient.clearUserCart(),
      (response) => response.toCartResponseEntity(),
    );
  }
}
