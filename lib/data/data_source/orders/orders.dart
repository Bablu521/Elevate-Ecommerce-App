
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';

import 'package:elevate_ecommerce_app/domin/models/response/order_page/orders_page.dart';

abstract class OrdersRemoteDataSource{
  Future<ApiResult<OrdersPageEntity>>  getOrders();

}