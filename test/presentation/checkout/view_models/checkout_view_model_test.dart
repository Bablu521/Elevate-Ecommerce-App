import 'package:bloc_test/bloc_test.dart';
import 'package:elevate_ecommerce_app/api/mapper/orders/orders_mapper.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/address_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/cart_response_entity/cart_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/cart_response_entity/cart_item_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/cart_response_entity/cart_response_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/product_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/responses/orders/cash_order_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/responses/orders/credit_order_entity.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/checkout_cash_order_use_case.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/checkout_credit_order_use_case.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/get_logged_user_addresses_use_case.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/get_logged_user_cart_use_case.dart';
import 'package:elevate_ecommerce_app/presentation/checkout/view_models/checkout_events.dart';
import 'package:elevate_ecommerce_app/presentation/checkout/view_models/checkout_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'checkout_view_model_test.mocks.dart';

@GenerateMocks([
  GetLoggedUserCartUseCase,
  GetLoggedUserAddressesUseCase,
  CheckoutCashOrderUseCase,
  CheckoutCreditOrderUseCase,
])
void main() {
  group("test CheckoutViewModel", () {
    late MockGetLoggedUserCartUseCase mockGetLoggedUserCartUseCase;
    late MockGetLoggedUserAddressesUseCase mockGetLoggedUserAddressesUseCase;
    late MockCheckoutCashOrderUseCase mockCheckoutCashOrderUseCase;
    late MockCheckoutCreditOrderUseCase mockCheckoutCreditOrderUseCase;
    late CheckoutViewModel checkoutViewModel;
    late CheckoutState state;

    setUp(() {
      mockGetLoggedUserCartUseCase = MockGetLoggedUserCartUseCase();
      mockGetLoggedUserAddressesUseCase = MockGetLoggedUserAddressesUseCase();
      mockCheckoutCashOrderUseCase = MockCheckoutCashOrderUseCase();
      mockCheckoutCreditOrderUseCase = MockCheckoutCreditOrderUseCase();
      checkoutViewModel = CheckoutViewModel(
        mockGetLoggedUserCartUseCase,
        mockGetLoggedUserAddressesUseCase,
        mockCheckoutCashOrderUseCase,
        mockCheckoutCreditOrderUseCase,
      );
      state = const CheckoutState();
    });

    group("test getLoggedUserCart", () {
      final expectedEntity = CartResponseEntity(
        message: "fake-message",
        numOfCartItems: 5,
        cart: CartEntity(
          id: "fake-id",
          user: "fake-user",
          appliedCoupons: ["fake-coupon"],
          totalPrice: 5,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          v: 5,
          cartItems: [
            CartItemEntity(
              id: "fake-id",
              quantity: 5,
              price: 50,
              product: ProductEntity(
                rateAvg: 5,
                rateCount: 10,
                id: "fake-id",
                title: "fake-title",
                slug: "fake-slug",
                description: "fake-description",
                imgCover: "fake-imgCover",
                images: ["fake-image1", "fake-image2"],
                price: 100,
                priceAfterDiscount: 80,
                quantity: 50,
                category: "fake-category",
                occasion: "fake-occasion",
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
                v: 1,
                isSuperAdmin: false,
                sold: 20,
              ),
            ),
          ],
        ),
      );

      final expectedResult = ApiSuccessResult<CartResponseEntity>(
        expectedEntity,
      );
      provideDummy<ApiResult<CartResponseEntity>>(expectedResult);

      blocTest<CheckoutViewModel, CheckoutState>(
        'call doIntent with GetUserCartEvent then load and succeeded',
        build: () => checkoutViewModel,
        act: (bloc) {
          when(
            mockGetLoggedUserCartUseCase(),
          ).thenAnswer((_) async => expectedResult);
          return bloc.doIntent(GetUserCartEvent());
        },
        expect: () => [
          state.copyWith(
            subTotal: expectedResult.data.cart?.totalPrice,
            total:
                (expectedResult.data.cart!.totalPrice! +
                checkoutViewModel.deliveryFee),
          ),
        ],
        verify: (_) {
          verify(mockGetLoggedUserCartUseCase()).called(1);
        },
      );

      final errorMessage = "Server Error";
      final expectedError = ApiErrorResult<CartResponseEntity>(errorMessage);
      provideDummy<ApiResult<CartResponseEntity>>(expectedError);

      blocTest<CheckoutViewModel, CheckoutState>(
        "call doIntent with GetUserCartEvent then load and failed",
        build: () => checkoutViewModel,
        act: (bloc) async {
          when(
            mockGetLoggedUserCartUseCase(),
          ).thenAnswer((_) async => expectedError);
          return bloc.doIntent(GetUserCartEvent());
        },
        expect: () => [state.copyWith(errorMessage: errorMessage)],
        verify: (_) {
          verify(mockGetLoggedUserCartUseCase()).called(1);
        },
      );
    });

    group("test getLoggedUserAddresses", () {
      final expectedList = [
        const AddressEntity(
          street: "fake-street-1",
          phone: "fake-phone-1",
          city: "fake-city-1",
          lat: "fake-lat-1",
          long: "fake-long-1",
          username: "fake-username-1",
          id: "fake-id",
        ),
        const AddressEntity(
          street: "fake-street-2",
          phone: "fake-phone-2",
          city: "fake-city-2",
          lat: "fake-lat-2",
          long: "fake-long-2",
          username: "fake-username-2",
          id: "fake-id-2",
        ),
      ];

      final expectedResult = ApiSuccessResult<List<AddressEntity>>(
        expectedList,
      );
      provideDummy<ApiResult<List<AddressEntity>>>(expectedResult);

      blocTest<CheckoutViewModel, CheckoutState>(
        'call doIntent with GetUserAddressesEvent then load and succeeded',
        build: () => checkoutViewModel,
        act: (bloc) {
          when(
            mockGetLoggedUserAddressesUseCase(),
          ).thenAnswer((_) async => expectedResult);
          return bloc.doIntent(GetUserAddressesEvent());
        },
        expect: () => [state.copyWith(addressesList: expectedList)],
        verify: (_) {
          verify(mockGetLoggedUserAddressesUseCase()).called(1);
        },
      );

      final errorMessage = "Server Error";
      final expectedError = ApiErrorResult<List<AddressEntity>>(errorMessage);
      provideDummy<ApiResult<List<AddressEntity>>>(expectedError);

      blocTest<CheckoutViewModel, CheckoutState>(
        "call doIntent with GetUserAddressesEvent then load and failed",
        build: () => checkoutViewModel,
        act: (bloc) async {
          when(
            mockGetLoggedUserAddressesUseCase(),
          ).thenAnswer((_) async => expectedError);
          return bloc.doIntent(GetUserAddressesEvent());
        },
        expect: () => [state.copyWith(errorMessage: errorMessage)],
        verify: (_) {
          verify(mockGetLoggedUserAddressesUseCase()).called(1);
        },
      );
    });

    group("test checkoutOrder with cash", () {
      final expectedAddressList = [
        const AddressEntity(
          street: "fake-street-1",
          phone: "fake-phone-1",
          city: "fake-city-1",
          lat: "fake-lat-1",
          long: "fake-long-1",
          username: "fake-username-1",
          id: "fake-id",
        ),
        const AddressEntity(
          street: "fake-street-2",
          phone: "fake-phone-2",
          city: "fake-city-2",
          lat: "fake-lat-2",
          long: "fake-long-2",
          username: "fake-username-2",
          id: "fake-id-2",
        ),
      ];

      final expectedRequestEntity = expectedAddressList[0]
          .toShippingAddressEntity();

      final expectedCashOrderEntity = const CashOrderEntity(
        message: "fake-message",
      );

      final expectedResult = ApiSuccessResult<CashOrderEntity>(
        expectedCashOrderEntity,
      );
      provideDummy<ApiResult<CashOrderEntity>>(expectedResult);

      blocTest<CheckoutViewModel, CheckoutState>(
        'call doIntent with CheckoutOrderEvent then load and succeeded',
        build: () => checkoutViewModel,
        //seed: () => state.copyWith(addressesList: expectedAddressList),
        act: (bloc) {
          when(
            mockCheckoutCashOrderUseCase(
              expectedAddressList[0].toShippingAddressEntity(),
            ),
          ).thenAnswer((_) async => expectedResult);
          bloc.emit(state.copyWith(addressesList: expectedAddressList));
          return bloc.doIntent(CheckoutOrderEvent());
        },
        expect: () => [
          state.copyWith(addressesList: expectedAddressList),
          state.copyWith(addressesList: expectedAddressList, isLoading: true),
          state.copyWith(
            addressesList: expectedAddressList,
            isSuccessCashOrder: true,
          ),
        ],
        verify: (_) {
          verify(mockCheckoutCashOrderUseCase(expectedRequestEntity)).called(1);
        },
      );

      final errorMessage = "Server Error";
      final expectedError = ApiErrorResult<CashOrderEntity>(errorMessage);
      provideDummy<ApiResult<CashOrderEntity>>(expectedError);

      blocTest<CheckoutViewModel, CheckoutState>(
        "call doIntent with CheckoutOrderEvent then load and failed",
        build: () => checkoutViewModel,
        act: (bloc) async {
          when(
            mockCheckoutCashOrderUseCase(expectedRequestEntity),
          ).thenAnswer((_) async => expectedError);
          bloc.emit(state.copyWith(addressesList: expectedAddressList));
          return bloc.doIntent(CheckoutOrderEvent());
        },
        expect: () => [
          state.copyWith(addressesList: expectedAddressList),
          state.copyWith(addressesList: expectedAddressList, isLoading: true),
          state.copyWith(addressesList: expectedAddressList, errorMessage: errorMessage),
        ],
        verify: (_) {
          verify(mockCheckoutCashOrderUseCase(expectedRequestEntity)).called(1);
        },
      );
    });

    group("test checkoutOrder with credit", () {
      final expectedAddressList = [
        const AddressEntity(
          street: "fake-street-1",
          phone: "fake-phone-1",
          city: "fake-city-1",
          lat: "fake-lat-1",
          long: "fake-long-1",
          username: "fake-username-1",
          id: "fake-id",
        ),
        const AddressEntity(
          street: "fake-street-2",
          phone: "fake-phone-2",
          city: "fake-city-2",
          lat: "fake-lat-2",
          long: "fake-long-2",
          username: "fake-username-2",
          id: "fake-id-2",
        ),
      ];

      final expectedRequestEntity = expectedAddressList[0]
          .toShippingAddressEntity();

      final expectedCreditOrderEntity = const CreditOrderEntity(
        message: "fake-message",
        url: "fake-url",
      );

      final expectedResult = ApiSuccessResult<CreditOrderEntity>(
        expectedCreditOrderEntity,
      );
      provideDummy<ApiResult<CreditOrderEntity>>(expectedResult);

      blocTest<CheckoutViewModel, CheckoutState>(
        'call doIntent with CheckoutOrderEvent then load and succeeded',
        build: () => checkoutViewModel,
        //seed: () => state.copyWith(addressesList: expectedAddressList),
        act: (bloc) {
          when(
            mockCheckoutCreditOrderUseCase(
              expectedAddressList[0].toShippingAddressEntity(),
            ),
          ).thenAnswer((_) async => expectedResult);
          bloc.emit(state.copyWith(addressesList: expectedAddressList));
          bloc.selectedPaymentIndex.value = 1;
          return bloc.doIntent(CheckoutOrderEvent());
        },
        expect: () => [
          state.copyWith(addressesList: expectedAddressList),
          state.copyWith(addressesList: expectedAddressList, isLoading: true),
          state.copyWith(
            addressesList: expectedAddressList,
            isSuccessCreditOrder: true,
          ),
        ],
        verify: (_) {
          verify(mockCheckoutCreditOrderUseCase(expectedRequestEntity)).called(1);
        },
      );

      final errorMessage = "Server Error";
      final expectedError = ApiErrorResult<CreditOrderEntity>(errorMessage);
      provideDummy<ApiResult<CreditOrderEntity>>(expectedError);

      blocTest<CheckoutViewModel, CheckoutState>(
        "call doIntent with CheckoutOrderEvent then load and failed",
        build: () => checkoutViewModel,
        act: (bloc) async {
          when(
            mockCheckoutCreditOrderUseCase(expectedRequestEntity),
          ).thenAnswer((_) async => expectedError);
          bloc.emit(state.copyWith(addressesList: expectedAddressList));
          bloc.selectedPaymentIndex.value = 1;
          return bloc.doIntent(CheckoutOrderEvent());
        },
        expect: () => [
          state.copyWith(addressesList: expectedAddressList),
          state.copyWith(addressesList: expectedAddressList, isLoading: true),
          state.copyWith(addressesList: expectedAddressList, errorMessage: errorMessage),
        ],
        verify: (_) {
          verify(mockCheckoutCreditOrderUseCase(expectedRequestEntity)).called(1);
        },
      );
    });
  });
}
