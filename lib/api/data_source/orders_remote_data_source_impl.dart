import 'package:elevate_ecommerce_app/api/mapper/orders/orders_mapper.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/orders/order_request.dart';
import 'package:elevate_ecommerce_app/domin/entities/orders_page_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/orders/shipping_address_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/responses/orders/cash_order_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/responses/orders/credit_order_entity.dart';
import 'package:injectable/injectable.dart';
import '../../core/api_result/api_result.dart';
import '../../data/data_source/orders_remote_data_source.dart';
import '../client/api_client.dart';
import '../mapper/order/order_page_mapper.dart';

@Injectable(as:OrdersRemoteDataSource)
class OrdersRemoteDataSourceImpl extends OrdersRemoteDataSource{
  final ApiClient _apiClient;
  OrdersRemoteDataSourceImpl(this._apiClient);


  @override
  Future<ApiResult<OrdersPageEntity>> getOrders() async {
    try{
      final response = await _apiClient.getOrders(
      );
      final  responseEntity=OrderPageMapper.toOrdersPageEntity(orderdto: response);
      return ApiSuccessResult(responseEntity );
    }
    catch (e){
      return ApiErrorResult(e);
    }
  }

  @override
  Future<ApiResult<CashOrderEntity>> checkoutCashOrder(
    ShippingAddressEntity shippingAddressEntity,
  ) {
    return safeApiCall(
      () => _apiClient.checkoutCashOrder(
        OrderRequest(shippingAddress: shippingAddressEntity.fromDomain()),
      ),
      (response) => response.toEntity(),
    );
  }

  @override
  Future<ApiResult<CreditOrderEntity>> checkoutCreditOrder(
    ShippingAddressEntity shippingAddressEntity,
  ) {
    return safeApiCall(
      () => _apiClient.checkoutCreditOrder(
        OrderRequest(shippingAddress: shippingAddressEntity.fromDomain()),
      ),
      (response) => response.toEntity(),
    );
  }
}



