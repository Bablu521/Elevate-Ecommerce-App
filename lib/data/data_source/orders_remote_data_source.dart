import '../../core/api_result/api_result.dart';
import '../../domin/entities/requests/orders/shipping_address_entity.dart';
import '../../domin/entities/responses/orders/cash_order_entity.dart';
import '../../domin/entities/responses/orders/credit_order_entity.dart';

abstract interface class OrdersRemoteDataSource {
  Future<ApiResult<CashOrderEntity>> checkoutCashOrder(
    ShippingAddressEntity shippingAddressEntity,
  );

  Future<ApiResult<CreditOrderEntity>> checkoutCreditOrder(
    ShippingAddressEntity shippingAddressEntity,
  );
}
