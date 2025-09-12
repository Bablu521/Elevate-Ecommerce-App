import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/data/data_source/orders/orders.dart';
import 'package:elevate_ecommerce_app/data/repositories/orders/orders_repo_imp.dart';
import 'package:elevate_ecommerce_app/domin/models/response/order_page/orders_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'orders_repo_imp_test.mocks.dart';


@GenerateMocks([OrdersRemoteDataSource])
void main() {
  test('when call getOrders it should getOrders from data source with correct parameters', () async{
    // Arrange

   final orderList= [  OrdersEntity(
     Id: "1",
     orderNumber: "ORD-1001",
     user: "User 1",
     state: "active", // أو "completed"
     isDelivered: false,
     isPaid: false,
     paymentType: "cash",
     totalPrice: 150,
     createdAt: DateTime.now().toString(),
     updatedAt: DateTime.now().toString(),
     V: 0,
   ),];

    final mockDataSource   =MockOrdersRemoteDataSource();
    final  repo = OrdersRepoImp(ordersRemoteDataSource:mockDataSource );

    final expectedResult=ApiSuccessResult(OrdersPageEntity(
        message: "success",
       orders: orderList
    ));

    provideDummy<ApiResult<OrdersPageEntity>>(expectedResult);


    when(mockDataSource.getOrders()).thenAnswer ((_) async => expectedResult);

    // Act


    final response=await repo.getOrders();

    //assert
    verify(mockDataSource.getOrders()).called(1);
    expect(response, isA<ApiSuccessResult<OrdersPageEntity>>());
    final success = response as ApiSuccessResult<OrdersPageEntity>;
    expect(success.data, equals(expectedResult.data));

  });


}