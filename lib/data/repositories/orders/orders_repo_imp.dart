import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/models/response/order_page/orders_page.dart';
import 'package:injectable/injectable.dart';
import '../../../domin/repositories/orders/orders.dart';
import '../../data_source/orders/orders.dart';

@Injectable(as:OrdersRepo)
class OrdersRepoImp extends OrdersRepo{
  final OrdersRemoteDataSource ordersRemoteDataSource;

  OrdersRepoImp({required this.ordersRemoteDataSource});



  @override
     Future<ApiResult<OrdersPageEntity>>  getOrders() async {
    try{
      final response = await ordersRemoteDataSource.getOrders();
      return response;
    } catch (e){
      return  ApiErrorResult(e);

    }
  }
}