import 'package:elevate_ecommerce_app/domin/models/response/order_page/orders_page.dart';
import 'package:injectable/injectable.dart';
import '../../../core/api_result/api_result.dart';
import '../../../data/data_source/orders/orders.dart';
import '../../client/api_client.dart';
import '../../mapper/order/order_page_mapper.dart';

@Injectable(as:OrdersRemoteDataSource)
class OrdersRemoteDataSourceImpl extends OrdersRemoteDataSource{

  ApiClient apiClient;

  OrdersRemoteDataSourceImpl({required this.apiClient,});



  @override
  Future<ApiResult<OrdersPageEntity>> getOrders() async {
    try{

     var token1= "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiNjhiNzgxMTNhOGJjYTMwN2Y5ZTIxYmM5Iiwicm9sZSI6InVzZXIiLCJpYXQiOjE3NTc1NTY4ODZ9.aPuSoNG0gNFnc-TOuXSCn1JKOOsScg4xNCUqGrl0QU8";


      final response = await apiClient.getOrders(
          // token="Bearer $token1",

      );

      final  responseEntity=OrderPageMapper.toOrdersPageEntity(orderdto: response);
      return ApiSuccessResult(responseEntity );

    }
    catch (e){
      return ApiErrorResult(e);
    }
  }






}
