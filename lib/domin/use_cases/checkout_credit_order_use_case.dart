import 'package:injectable/injectable.dart';

import '../../core/api_result/api_result.dart';
import '../entities/requests/orders/shipping_address_entity.dart';
import '../entities/responses/orders/credit_order_entity.dart';
import '../repositories/orders_repo.dart';

@injectable
class CheckoutCreditOrderUseCase {
  final OrdersRepo _ordersRepo;

  CheckoutCreditOrderUseCase(this._ordersRepo);

  Future<ApiResult<CreditOrderEntity>> call(
    ShippingAddressEntity shippingAddressEntity,
  ) async {
    return await _ordersRepo.checkoutCreditOrder(shippingAddressEntity);
  }
}
