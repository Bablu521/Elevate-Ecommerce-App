import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/cart_response_entity/cart_response_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/add_product_to_cart_request_entity.dart';
import 'package:elevate_ecommerce_app/domin/repositories/cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddProductToCartUseCase {
  final CartRepo _cartRepo;
  const AddProductToCartUseCase(this._cartRepo);

  Future<ApiResult<CartResponseEntity>> call(
    AddProductToCartRequestEntity addProductToCartRequestEntity,
  ) {
    return _cartRepo.addProductToCart(addProductToCartRequestEntity);
  }
}
