import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/orders/shipping_address_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/responses/orders/cash_order_entity.dart';
import 'package:elevate_ecommerce_app/domin/repositories/orders_repo.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/checkout_cash_order_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'checkout_cash_order_use_case_test.mocks.dart';

@GenerateMocks([OrdersRepo])
void main() {
  group("test CheckoutCashOrderUseCase", () {
    late MockOrdersRepo mockOrdersRepo;
    late CheckoutCashOrderUseCase checkoutCashOrderUseCase;

    setUp(() {
      mockOrdersRepo = MockOrdersRepo();
      checkoutCashOrderUseCase = CheckoutCashOrderUseCase(mockOrdersRepo);
    });

    final expectedRequestEntity = ShippingAddressEntity(
      street: "fake-street",
      phone: "fake-phone",
      city: "fake-city",
      lat: "fake-lat",
      long: "fake-long",
    );

    test(
      'when call it should return CashOrderEntity from repo with right parameters',
      () async {
        final expectedEntity = const CashOrderEntity(message: "fake-message");
        final expectedResult = ApiSuccessResult(expectedEntity);
        provideDummy<ApiResult<CashOrderEntity>>(expectedResult);
        when(
          mockOrdersRepo.checkoutCashOrder(expectedRequestEntity),
        ).thenAnswer((_) async => expectedResult);

        final result = await checkoutCashOrderUseCase(expectedRequestEntity);

        verify(
          mockOrdersRepo.checkoutCashOrder(expectedRequestEntity),
        ).called(1);
        expect(result, isA<ApiSuccessResult<CashOrderEntity>>());
        result as ApiSuccessResult<CashOrderEntity>;
        expect(result.data, equals(expectedEntity));
      },
    );

    test(
      "when checkoutCashOrder failed it should return an error result",
      () async {
        final expectedError = "Server Error";
        final expectedResult = ApiErrorResult<CashOrderEntity>(expectedError);
        provideDummy<ApiResult<CashOrderEntity>>(expectedResult);
        when(
          mockOrdersRepo.checkoutCashOrder(expectedRequestEntity),
        ).thenAnswer((_) async => expectedResult);

        final result = await checkoutCashOrderUseCase(expectedRequestEntity);

        verify(
          mockOrdersRepo.checkoutCashOrder(expectedRequestEntity),
        ).called(1);
        expect(result, isA<ApiErrorResult<CashOrderEntity>>());
        result as ApiErrorResult<CashOrderEntity>;
        expect(result.errorMessage, equals(expectedError));
      },
    );
  });
}
