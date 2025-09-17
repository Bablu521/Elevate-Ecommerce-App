import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/orders_page_entity.dart';

abstract class OrdersRemoteDataSource{
  Future<ApiResult<OrdersPageEntity>>  getOrders();

}