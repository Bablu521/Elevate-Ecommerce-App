import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/data/data_source/orders_remote_data_source.dart';
import 'package:elevate_ecommerce_app/data/repositories/orders_repo_impl.dart';
import 'package:elevate_ecommerce_app/domin/entities/orders_page_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/orders/shipping_address_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/responses/orders/cash_order_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/responses/orders/credit_order_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'orders_repo_impl_test.mocks.dart';

@GenerateMocks([OrdersRemoteDataSource])
void main() {
  group("test OrdersRepoImpl", () {
    late MockOrdersRemoteDataSource mockOrdersRemoteDataSource;
    late OrdersRepoImpl ordersRepoImpl;

    setUp(() {
      mockOrdersRemoteDataSource = MockOrdersRemoteDataSource();
      ordersRepoImpl = OrdersRepoImpl(mockOrdersRemoteDataSource);
    });

    test(
      'when call getOrders it should getOrders from data source with correct parameters',
      () async {
        // Arrange
        final orderList = [
          OrdersEntity(
            id: "1",
            orderNumber: "ORD-1001",
            user: "User 1",
            state: "active",
            isDelivered: false,
            isPaid: false,
            paymentType: "cash",
            totalPrice: 150,
            createdAt: DateTime.now().toString(),
            updatedAt: DateTime.now().toString(),
            V: 0,
          ),
        ];

        final expectedResult = ApiSuccessResult(
          OrdersPageEntity(message: "success", orders: orderList),
        );

        provideDummy<ApiResult<OrdersPageEntity>>(expectedResult);

        when(
          mockOrdersRemoteDataSource.getOrders(),
        ).thenAnswer((_) async => expectedResult);

        // Act
        final response = await ordersRepoImpl.getOrders();

        // Assert
        verify(mockOrdersRemoteDataSource.getOrders()).called(1);
        expect(response, isA<ApiSuccessResult<OrdersPageEntity>>());
        final success = response as ApiSuccessResult<OrdersPageEntity>;
        expect(success.data, equals(expectedResult.data));
      },
    );

    group("test checkoutCashOrder", () {
      final expectedRequestEntity = const ShippingAddressEntity(
        street: "fake-street",
        phone: "fake-phone",
        city: "fake-city",
        lat: "fake-lat",
        long: "fake-long",
      );

      test(
        'when call checkoutCashOrder it should return a CashOrderEntity from data source with right parameters',
        () async {
          final expectedEntity = const CashOrderEntity(message: "fake-message");
          final expectedResult = ApiSuccessResult<CashOrderEntity>(
            expectedEntity,
          );
          provideDummy<ApiResult<CashOrderEntity>>(expectedResult);

          when(
            mockOrdersRemoteDataSource.checkoutCashOrder(expectedRequestEntity),
          ).thenAnswer((_) async => expectedResult);

          final result = await ordersRepoImpl.checkoutCashOrder(
            expectedRequestEntity,
          );

          verify(
            mockOrdersRemoteDataSource.checkoutCashOrder(expectedRequestEntity),
          ).called(1);
          expect(result, isA<ApiSuccessResult<CashOrderEntity>>());
          result as ApiSuccessResult<CashOrderEntity>;
          expect(result.data, equals(expectedEntity));
        },
      );

      test(
        'when checkoutCashOrder failed it should return an error result',
        () async {
          final expectedError = "Server Error";
          final expectedResult = ApiErrorResult<CashOrderEntity>(expectedError);
          provideDummy<ApiResult<CashOrderEntity>>(expectedResult);

          when(
            mockOrdersRemoteDataSource.checkoutCashOrder(expectedRequestEntity),
          ).thenAnswer((_) async => expectedResult);

          final result = await ordersRepoImpl.checkoutCashOrder(
            expectedRequestEntity,
          );

          verify(
            mockOrdersRemoteDataSource.checkoutCashOrder(expectedRequestEntity),
          ).called(1);
          expect(result, isA<ApiErrorResult<CashOrderEntity>>());
          result as ApiErrorResult<CashOrderEntity>;
          expect(result.errorMessage, equals(expectedError));
        },
      );
    });

    group("test checkoutCreditOrder", () {
      final expectedRequestEntity = const ShippingAddressEntity(
        street: "fake-street",
        phone: "fake-phone",
        city: "fake-city",
        lat: "fake-lat",
        long: "fake-long",
      );

      test(
        'when call checkoutCreditOrder it should return a CreditOrderEntity from data source with right parameters',
        () async {
          final expectedEntity = const CreditOrderEntity(
            message: "fake-message",
            url: "fake-url",
          );
          final expectedResult = ApiSuccessResult<CreditOrderEntity>(
            expectedEntity,
          );
          provideDummy<ApiResult<CreditOrderEntity>>(expectedResult);

          when(
            mockOrdersRemoteDataSource.checkoutCreditOrder(
              expectedRequestEntity,
            ),
          ).thenAnswer((_) async => expectedResult);

          final result = await ordersRepoImpl.checkoutCreditOrder(
            expectedRequestEntity,
          );

          verify(
            mockOrdersRemoteDataSource.checkoutCreditOrder(
              expectedRequestEntity,
            ),
          ).called(1);
          expect(result, isA<ApiSuccessResult<CreditOrderEntity>>());
          result as ApiSuccessResult<CreditOrderEntity>;
          expect(result.data, equals(expectedEntity));
        },
      );

      test(
        'when checkoutCreditOrder failed it should return an error result',
        () async {
          final expectedError = "Server Error";
          final expectedResult = ApiErrorResult<CreditOrderEntity>(
            expectedError,
          );
          provideDummy<ApiResult<CreditOrderEntity>>(expectedResult);

          when(
            mockOrdersRemoteDataSource.checkoutCreditOrder(
              expectedRequestEntity,
            ),
          ).thenAnswer((_) async => expectedResult);

          final result = await ordersRepoImpl.checkoutCreditOrder(
            expectedRequestEntity,
          );

          verify(
            mockOrdersRemoteDataSource.checkoutCreditOrder(
              expectedRequestEntity,
            ),
          ).called(1);
          expect(result, isA<ApiErrorResult<CreditOrderEntity>>());
          result as ApiErrorResult<CreditOrderEntity>;
          expect(result.errorMessage, equals(expectedError));
        },
      );
    });
  });
}


