import 'package:elevate_ecommerce_app/domin/entities/orders_page_entity.dart';
import 'package:injectable/injectable.dart';
import '../../core/api_result/api_result.dart';
import '../../data/data_source/orders_remote_data_source.dart';
import '../client/api_client.dart';
import '../mapper/order/order_page_mapper.dart';

@Injectable(as:OrdersRemoteDataSource)
class OrdersRemoteDataSourceImpl extends OrdersRemoteDataSource{
  ApiClient apiClient;
  OrdersRemoteDataSourceImpl({required this.apiClient,});


  @override
  Future<ApiResult<OrdersPageEntity>> getOrders() async {
    try{
      final response = await apiClient.getOrders(
      );
      final  responseEntity=OrderPageMapper.toOrdersPageEntity(orderdto: response);
      return ApiSuccessResult(responseEntity );
    }
    catch (e){
      return ApiErrorResult(e);
    }
  }






}
