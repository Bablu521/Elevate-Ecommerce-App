import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/cart_response_entity/cart_response_entity.dart';
import 'package:elevate_ecommerce_app/domin/repositories/cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ClearUserCartUseCase {
  final CartRepo _cartRepo;
  const ClearUserCartUseCase(this._cartRepo);

  Future<ApiResult<CartResponseEntity>> call() {
    return _cartRepo.clearUserCart();
  }
}
