import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/orders/shipping_address_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/responses/orders/credit_order_entity.dart';
import 'package:elevate_ecommerce_app/domin/repositories/orders_repo.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/checkout_credit_order_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'checkout_credit_order_use_case_test.mocks.dart';

@GenerateMocks([OrdersRepo])
void main() {
  group("test CheckoutCreditOrderUseCase", () {
    late MockOrdersRepo mockCategoriesRepo;
    late CheckoutCreditOrderUseCase checkoutCreditOrderUseCase;

    setUp(() {
      mockCategoriesRepo = MockOrdersRepo();
      checkoutCreditOrderUseCase = CheckoutCreditOrderUseCase(
        mockCategoriesRepo,
      );
    });

    final expectedRequestEntity = const ShippingAddressEntity(
      street: "fake-street",
      phone: "fake-phone",
      city: "fake-city",
      lat: "fake-lat",
      long: "fake-long",
    );

    test(
      'when call it should return CreditOrderEntity from repo with right parameters',
      () async {
        final expectedEntity = const CreditOrderEntity(
          message: "fake-message",
          url: "fake-url",
        );
        final expectedResult = ApiSuccessResult(expectedEntity);
        provideDummy<ApiResult<CreditOrderEntity>>(expectedResult);
        when(
          mockCategoriesRepo.checkoutCreditOrder(expectedRequestEntity),
        ).thenAnswer((_) async => expectedResult);

        final result = await checkoutCreditOrderUseCase(expectedRequestEntity);

        verify(
          mockCategoriesRepo.checkoutCreditOrder(expectedRequestEntity),
        ).called(1);
        expect(result, isA<ApiSuccessResult<CreditOrderEntity>>());
        result as ApiSuccessResult<CreditOrderEntity>;
        expect(result.data, equals(expectedEntity));
      },
    );

    test("when call failed it should return an error result", () async {
      final expectedError = "Server Error";
      final expectedResult = ApiErrorResult<CreditOrderEntity>(expectedError);
      provideDummy<ApiResult<CreditOrderEntity>>(expectedResult);
      when(
        mockCategoriesRepo.checkoutCreditOrder(expectedRequestEntity),
      ).thenAnswer((_) async => expectedResult);

      final result = await checkoutCreditOrderUseCase.call(
        expectedRequestEntity,
      );

      verify(
        mockCategoriesRepo.checkoutCreditOrder(expectedRequestEntity),
      ).called(1);
      expect(result, isA<ApiErrorResult<CreditOrderEntity>>());
      result as ApiErrorResult<CreditOrderEntity>;
      expect(result.errorMessage, equals(expectedError));
    });
  });
}
