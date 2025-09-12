import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/models/response/order_page/orders_page.dart';
import 'package:elevate_ecommerce_app/domin/repositories/orders/orders.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/get_orders_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'get_orders_use_case_test.mocks.dart';

@GenerateMocks([OrdersRepo])
void main() {
  test('when call editProfile it should call editProfile from repo with correct parameters', () async {

    // Arrange
    final mockRepo=MockOrdersRepo();
    final GetOrdersUseCase repo=GetOrdersUseCase(repo: mockRepo );
    final orderList=   OrdersEntity(
      Id: "1",
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
    var expectedResult = ApiSuccessResult(OrdersPageEntity(
        message: "success",
        orders: [orderList]
    ));

    provideDummy<ApiResult<OrdersPageEntity>>(expectedResult);

    when(mockRepo.getOrders()).thenAnswer((_) async => expectedResult);

    //Act
    final response= await repo.call();
    //Assert
    verify(mockRepo.getOrders()).called(1);
    expect(response, isA<ApiSuccessResult<OrdersPageEntity>>());
    final success = response as ApiSuccessResult<OrdersPageEntity>;
    expect(success.data, equals(expectedResult.data));

  });
}