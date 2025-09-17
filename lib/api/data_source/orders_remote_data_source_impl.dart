import 'package:elevate_ecommerce_app/api/client/api_client.dart';
import 'package:elevate_ecommerce_app/api/mapper/orders/orders_mapper.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/orders/shipping_address_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/responses/orders/cash_order_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/responses/orders/credit_order_entity.dart';
import 'package:injectable/injectable.dart';

import '../../data/data_source/orders_remote_data_source.dart';

@Injectable(as: OrdersRemoteDataSource)
class OrdersRemoteDataSourceImpl implements OrdersRemoteDataSource {
  final ApiClient _apiClient;

  OrdersRemoteDataSourceImpl(this._apiClient);

  @override
  Future<ApiResult<CashOrderEntity>> checkoutCashOrder(
    ShippingAddressEntity shippingAddressEntity,
  ) {
    return safeApiCall(
      () => _apiClient.checkoutCashOrder(shippingAddressEntity.toOrderRequest()),
      (response) => response.toEntity(),
    );
  }

  @override
  Future<ApiResult<CreditOrderEntity>> checkoutCreditOrder(
    ShippingAddressEntity shippingAddressEntity,
  ) {
    return safeApiCall(
      () => _apiClient.checkoutCreditOrder(shippingAddressEntity.toOrderRequest()),
      (response) => response.toEntity(),
    );
  }
}
