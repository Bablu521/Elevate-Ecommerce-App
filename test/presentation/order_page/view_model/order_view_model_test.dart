import 'package:bloc_test/bloc_test.dart';
import 'package:elevate_ecommerce_app/domin/entities/orders_page_entity.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/get_orders_use_case.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/get_user_status_use_case.dart';
import 'package:elevate_ecommerce_app/presentation/order_page/view_model/order_view_model.dart';
import 'package:elevate_ecommerce_app/presentation/order_page/view_model/orders_event.dart';
import 'package:elevate_ecommerce_app/presentation/order_page/view_model/orders_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'order_view_model_test.mocks.dart';



@GenerateMocks([GetOrdersUseCase, GetUserStatusUseCase])
void main() {


  final orderList=   const OrdersEntity(
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
  provideDummy<ApiResult<OrdersPageEntity>>(
    ApiSuccessResult(OrdersPageEntity(
      message: "dummy",
      orders: [orderList]
    ),
    ));


  group("ProfileViewModel test", () {

    late List<OrdersEntity> fakeOrders;

    late MockGetOrdersUseCase mockGetOrderUseCase;
    setUp((){
      mockGetOrderUseCase =MockGetOrdersUseCase();
      fakeOrders = [
        const OrdersEntity(
          id: "1",
          orderNumber: "ORD-1001",
          user: "User 1",
          state: "active",
          isDelivered: false,
          isPaid: false,
          paymentType: "cash",
          totalPrice: 150,
          createdAt: "2025-09-11",
          updatedAt: "2025-09-11",
          V: 0,
        ),
        const OrdersEntity(
          id: "2",
          orderNumber: "ORD-1002",
          user: "User 2",
          state: "completed",
          isDelivered: true,
          isPaid: true,
          paymentType: "visa",
          totalPrice: 200,
          createdAt: "2025-09-11",
          updatedAt: "2025-09-11",
          V: 0,
        ),
      ];
    });




   final orderResponse= OrdersPageEntity(
     message: "message",
     orders: [orderList]
   );

    final expectedResult = ApiSuccessResult(orderResponse);

    blocTest<OrderViewModel, OrdersStates>(
      "emits loading then success when OnLoadOrdersEvent is added",
      build: () {
        when(mockGetOrderUseCase.call())
            .thenAnswer((_) async => expectedResult);
        return OrderViewModel(mockGetOrderUseCase);
      },
      act: (viewModel) => viewModel.doIntent(OnLoadOrdersEvent()),
      expect: () => [
        const OrdersStates(ordersListIsLoading: true),
        OrdersStates(
          ordersListIsLoading: false,
          ordersListSuccess: orderResponse,
        ),
      ],
      verify: (_) {
        verify(mockGetOrderUseCase.call()).called(1);
      },
    );
    const errorMessage = "network failed";
    final expectedErrorResult = ApiErrorResult<OrdersPageEntity>(errorMessage);

    blocTest<OrderViewModel, OrdersStates>(
      "emits loading then error when OnLoadOrdersEvent fails",
      build: () {
        when(mockGetOrderUseCase.call())
            .thenAnswer((_) async => expectedErrorResult);
        return OrderViewModel(mockGetOrderUseCase);
      },
      act: (viewModel) => viewModel.doIntent(OnLoadOrdersEvent()),
      expect: () => [
        const OrdersStates(ordersListIsLoading: true),
        const OrdersStates(
          ordersListIsLoading: false,
          ordersListErrorMessage: errorMessage,
        ),
      ],
      verify: (_) {
        verify(mockGetOrderUseCase.call()).called(1);
      },
    );

    blocTest<OrderViewModel, OrdersStates>(
      'emits state with activeOrders and completedOrders filtered correctly',
      build: () => OrderViewModel(mockGetOrderUseCase),
      act: (bloc) {
        bloc.emit(
          OrdersStates(
            ordersListSuccess: OrdersPageEntity(
              message: "success",
              orders: fakeOrders,
            ),
          ),
        );
      },
      verify: (bloc) {
        // Active Orders
        final active = bloc.activeOrders;
        expect(active.length, 1);
        expect(active.first.orderNumber, "ORD-1001");
        expect(active.first.isPaid, false);

        // Completed Orders
        final completed = bloc.completedOrders;
        expect(completed.length, 1);
        expect(completed.first.orderNumber, "ORD-1002");
        expect(completed.first.isPaid, true);
      },
    );

  });
}
