import 'package:elevate_ecommerce_app/api/client/api_client.dart';
import 'package:elevate_ecommerce_app/api/data_source/orders_remote_data_source_impl.dart';
import 'package:elevate_ecommerce_app/api/models/responses/order_page/order_data.dart';
import 'package:elevate_ecommerce_app/api/models/responses/order_page/orders_page.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/orders_page_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'orders_remote_data_source_impl_test.mocks.dart';

  @GenerateMocks([ApiClient])
void main() {
  test('should return success when getOrders is success', () async {

    final mokApi = MockApiClient();

   final OrdersRemoteDataSourceImpl repo =OrdersRemoteDataSourceImpl(
        apiClient: mokApi);

    final orderList=   OrdersDto(
      id: "1",
      orderNumber: "ORD-1001",
      user: "User 1",
      state: "active", // أو "completed"
      isDelivered: false,
      isPaid: false,
      paymentType: "cash",
      totalPrice: 150,
      createdAt:null,
      updatedAt: null,
      V: 0,
    );

    when(mokApi.getOrders()).thenAnswer( (_) async =>  OrdersPageDto(
      message: "success",
      orders:  [orderList]
    ));

    final result = await repo.getOrders();

    expect(result, isA<ApiSuccessResult<OrdersPageEntity>>());
    final success =result as ApiSuccessResult<OrdersPageEntity>;
    expect(success.data.message,"success" );
    expect(success.data.orders, equals([ const OrdersEntity(
      id: "1",
      orderNumber: "ORD-1001",
      user: "User 1",
      state: "active",
      isDelivered: false,
      isPaid: false,
      paymentType: "cash",
      totalPrice: 150,
      createdAt: null,
      updatedAt: null,
      V: 0,
    )]));

  });
}