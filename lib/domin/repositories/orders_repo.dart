import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/orders_page_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/orders/shipping_address_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/responses/orders/cash_order_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/responses/orders/credit_order_entity.dart';

abstract interface class OrdersRepo {
  Future<ApiResult<CashOrderEntity>> checkoutCashOrder(
    ShippingAddressEntity shippingAddressEntity,
  );

  Future<ApiResult<CreditOrderEntity>> checkoutCreditOrder(
    ShippingAddressEntity shippingAddressEntity,
  );

  Future<ApiResult<OrdersPageEntity>> getOrders();
}


