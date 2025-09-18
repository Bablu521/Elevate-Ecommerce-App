import 'package:elevate_ecommerce_app/domin/repositories/orders_repo.dart';
import 'package:injectable/injectable.dart';

import '../../core/api_result/api_result.dart';
import '../entities/requests/orders/shipping_address_entity.dart';
import '../entities/responses/orders/cash_order_entity.dart';

@injectable
class CheckoutCashOrderUseCase {
  final OrdersRepo _ordersRepo;

  CheckoutCashOrderUseCase(this._ordersRepo);

  Future<ApiResult<CashOrderEntity>> call(
    ShippingAddressEntity shippingAddressEntity,
  ) async {
    return await _ordersRepo.checkoutCashOrder(shippingAddressEntity);
  }
}
