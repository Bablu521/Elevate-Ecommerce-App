import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/models/response/order_page/orders_page.dart';
import 'package:elevate_ecommerce_app/domin/repositories/orders/orders.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetOrdersUseCase{
  OrdersRepo repo;
  GetOrdersUseCase({required this.repo});

  Future<ApiResult<OrdersPageEntity>> call()async{
    return await repo.getOrders();
  }

}