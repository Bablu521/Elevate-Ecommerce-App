import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/orders_page_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/orders/shipping_address_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/responses/orders/cash_order_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/responses/orders/credit_order_entity.dart';
import 'package:injectable/injectable.dart';
import '../../domin/repositories/orders_repo.dart';
import '../data_source/orders_remote_data_source.dart';

@Injectable(as:OrdersRepo)
class OrdersRepoImp implements OrdersRepo {
  final OrdersRemoteDataSource _ordersRemoteDataSource;

  OrdersRepoImp(this._ordersRemoteDataSource);



  @override
     Future<ApiResult<OrdersPageEntity>>  getOrders() async {
    try{
      final response = await _ordersRemoteDataSource.getOrders();
      return response;
    } catch (e){
      return  ApiErrorResult(e);

    }
  }
  @override
  Future<ApiResult<CashOrderEntity>> checkoutCashOrder(
    ShippingAddressEntity shippingAddressEntity,
  ) {
    return _ordersRemoteDataSource.checkoutCashOrder(shippingAddressEntity);
  }

  @override
  Future<ApiResult<CreditOrderEntity>> checkoutCreditOrder(
    ShippingAddressEntity shippingAddressEntity,
  ) {
    return _ordersRemoteDataSource.checkoutCreditOrder(shippingAddressEntity);
  }
}

