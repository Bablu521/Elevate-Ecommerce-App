import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_ecommerce_app/presentation/cart/view_models/cart_view_model.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/cart_response_entity/cart_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/cart_response_entity/cart_item_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/cart_response_entity/cart_response_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/cart_response_entity/product_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/add_product_to_cart_request_entity.dart';
import 'package:elevate_ecommerce_app/presentation/cart/view_models/cart_events.dart';
import 'package:elevate_ecommerce_app/presentation/cart/view_models/cart_states.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/add_product_to_cart_use_case.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/clear_user_cart_use_case.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/delete_specific_cart_item_use_case.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/get_logged_user_cart_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';

import 'cart_view_model_test.mocks.dart';

@GenerateMocks([
  GetLoggedUserCartUseCase,
  AddProductToCartUseCase,
  DeleteSpecificCartItemUseCase,
  ClearUserCartUseCase,
])
void main() {
  group('Test CartViewModel', () {
    late MockGetLoggedUserCartUseCase mockedGetLoggedUserCartUseCase;
    late MockAddProductToCartUseCase mockedAddProductToCartUseCase;
    late MockDeleteSpecificCartItemUseCase mockedDeleteSpecificCartItemUseCase;
    late MockClearUserCartUseCase mockedClearUserCartUseCase;
    late CartViewModel cartViewModel;
    const CartStates state = CartStates();
    late ProductEntity productEntity;
    late CartItemEntity cartItemEntity;
    late CartEntity cartEntity;
    late CartResponseEntity expectedCartResponseEntity;
    late AddProductToCartRequestEntity addProductToCartRequestEntity;
    const expectedError = "Server Error";
    const productId = "fake-id";
    late ApiResult<CartResponseEntity> expectedResult;
    late ApiResult<CartResponseEntity> expectedFailure;

    setUp(() {
      mockedGetLoggedUserCartUseCase = MockGetLoggedUserCartUseCase();
      mockedAddProductToCartUseCase = MockAddProductToCartUseCase();
      mockedDeleteSpecificCartItemUseCase = MockDeleteSpecificCartItemUseCase();
      mockedClearUserCartUseCase = MockClearUserCartUseCase();
      cartViewModel = CartViewModel(
        mockedGetLoggedUserCartUseCase,
        mockedAddProductToCartUseCase,
        mockedDeleteSpecificCartItemUseCase,
        mockedClearUserCartUseCase,
      );
      
      productEntity = ProductEntity(
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
      );

      cartItemEntity = CartItemEntity(
        product: productEntity,
        price: 50,
        quantity: 5,
        id: "fake-id",
      );
      cartEntity = CartEntity(
        id: "fake-id",
        user: "fake-user",
        cartItems: [cartItemEntity],
        appliedCoupons: ["fake-coupon"],
        totalPrice: 5,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        v: 5,
      );

      expectedCartResponseEntity = CartResponseEntity(
        message: "fake-message",
        numOfCartItems: 5,
        cart: cartEntity,
      );

      addProductToCartRequestEntity = const AddProductToCartRequestEntity(
        product: "fake-product",
        quantity: 5,
      );

      expectedResult = ApiSuccessResult(expectedCartResponseEntity);
      provideDummy<ApiResult<CartResponseEntity>>(expectedResult);
      expectedFailure = ApiErrorResult<CartResponseEntity>(expectedError);
      provideDummy<ApiResult<CartResponseEntity>>(expectedFailure);
    });

    blocTest<CartViewModel, CartStates>(
      'call doIntent with OnLoadLoggedUserCartDataEvent then load and successed',
      build: () => cartViewModel,
      act: (cartViewModel) async {
        when(
          mockedGetLoggedUserCartUseCase.call(),
        ).thenAnswer((_) async => expectedResult);
        return cartViewModel.doIntent(OnLoadLoggedUserCartDataEvent());
      },
      expect: () => [
        state.copyWith(cartDataLoading: true),
        state.copyWith(
          cartDataLoading: false,
          cartDataSuccess: expectedCartResponseEntity,
        ),
      ],
      verify: (_) {
        verify(mockedGetLoggedUserCartUseCase.call()).called(1);
      },
    );

    blocTest<CartViewModel, CartStates>(
      'call doIntent with OnLoadLoggedUserCartDataEvent then load and failed',
      build: () => cartViewModel,
      act: (cartViewModel) async {
        when(
          mockedGetLoggedUserCartUseCase.call(),
        ).thenAnswer((_) async => expectedFailure);
        return cartViewModel.doIntent(OnLoadLoggedUserCartDataEvent());
      },
      expect: () => [
        state.copyWith(cartDataLoading: true),
        state.copyWith(
          cartDataLoading: false,
          cartDataErrorMessage: expectedError,
        ),
      ],
      verify: (_) {
        verify(mockedGetLoggedUserCartUseCase.call()).called(1);
      },
    );

    blocTest<CartViewModel, CartStates>(
      'call doIntent with OnIncrementProductToCartEvent then successed',
      build: () => cartViewModel,
      act: (cartViewModel) async {
        when(
          mockedAddProductToCartUseCase.call(addProductToCartRequestEntity),
        ).thenAnswer((_) async => expectedResult);
        return cartViewModel.doIntent(
          OnIncrementProductToCartEvent(
            addProductToCartRequestEntity: addProductToCartRequestEntity,
          ),
        );
      },
      expect: () => [state.copyWith(cartDataSuccess: expectedCartResponseEntity)],
      verify: (_) {
        verify(
          mockedAddProductToCartUseCase.call(addProductToCartRequestEntity),
        ).called(1);
      },
    );

  
    blocTest<CartViewModel, CartStates>(
      'call doIntent with OnIncrementProductToCartEvent then failed',
      build: () => cartViewModel,
      act: (cartViewModel) async {
        when(
          mockedAddProductToCartUseCase.call(addProductToCartRequestEntity),
        ).thenAnswer((_) async => expectedFailure);
        return cartViewModel.doIntent(
          OnIncrementProductToCartEvent(
            addProductToCartRequestEntity: addProductToCartRequestEntity,
          ),
        );
      },
      expect: () => [state.copyWith(cartDataErrorMessage: expectedError)],
      verify: (_) {
        verify(mockedAddProductToCartUseCase.call(addProductToCartRequestEntity)).called(1);
      },
    );

    blocTest<CartViewModel, CartStates>(
      'call doIntent with OnDecrementProductFromCartEvent then successed',
      build: () => cartViewModel,
      act: (cartViewModel) async {
        when(
          mockedAddProductToCartUseCase.call(addProductToCartRequestEntity),
        ).thenAnswer((_) async => expectedResult);
        return cartViewModel.doIntent(
          OnDecrementProductFromCartEvent(addProductToCartRequestEntity: addProductToCartRequestEntity)
        );
      },
      expect: () => [
        state.copyWith(cartDataSuccess: expectedCartResponseEntity),
      ],
      verify: (_) {
        verify(
          mockedAddProductToCartUseCase.call(addProductToCartRequestEntity),
        ).called(1);
      },
    );

    blocTest<CartViewModel, CartStates>(
      'call doIntent with OnDecrementProductFromCartEvent then failed',
      build: () => cartViewModel,
      act: (cartViewModel) async {
        when(
          mockedAddProductToCartUseCase.call(addProductToCartRequestEntity),
        ).thenAnswer((_) async => expectedFailure);
        return cartViewModel.doIntent(
          OnDecrementProductFromCartEvent(addProductToCartRequestEntity: addProductToCartRequestEntity)
        );
      },
      expect: () => [state.copyWith(cartDataErrorMessage: expectedError)],
      verify: (_) {
        verify(
          mockedAddProductToCartUseCase.call(addProductToCartRequestEntity),
        ).called(1);
      },
    );

    blocTest<CartViewModel, CartStates>(
      'call doIntent with OnDeleteSpecificCartItemEvent then successed',
      build: () => cartViewModel,
      act: (cartViewModel) async {
        when(
          mockedDeleteSpecificCartItemUseCase.call(productId),
        ).thenAnswer((_) async => expectedResult);
        return cartViewModel.doIntent(
          OnDeleteSpecificCartItemEvent(productId: productId)
        );
      },
      expect: () => [
        state.copyWith(cartDataSuccess: expectedCartResponseEntity),
      ],
      verify: (_) {
        verify(
          mockedDeleteSpecificCartItemUseCase.call(productId),
        ).called(1);
      },
    );

    blocTest<CartViewModel, CartStates>(
      'call doIntent with OnDeleteSpecificCartItemEvent then failed',
      build: () => cartViewModel,
      act: (cartViewModel) async {
        when(
          mockedDeleteSpecificCartItemUseCase.call(productId),
        ).thenAnswer((_) async => expectedFailure);
        return cartViewModel.doIntent(
          OnDeleteSpecificCartItemEvent(productId: productId)
        );
      },
      expect: () => [state.copyWith(cartDataErrorMessage: expectedError)],
      verify: (_) {
        verify(
          mockedDeleteSpecificCartItemUseCase.call(productId),
        ).called(1);
      },
    );

      blocTest<CartViewModel, CartStates>(
      'call doIntent with OnClearUserCartEvent then successed',
      build: () => cartViewModel,
      act: (cartViewModel) async {
        when(
          mockedClearUserCartUseCase.call()
        ).thenAnswer((_) async => expectedResult);
        return cartViewModel.doIntent(
          OnClearUserCartEvent()
        );
      },
      expect: () => [
        state.copyWith(cartDataSuccess: expectedCartResponseEntity),
      ],
      verify: (_) {
        verify(
          mockedClearUserCartUseCase.call()
        ).called(1);
      },
    );

    blocTest<CartViewModel, CartStates>(
      'call doIntent with OnClearUserCartEvent then failed',
      build: () => cartViewModel,
      act: (cartViewModel) async {
        when(
          mockedClearUserCartUseCase.call(),
        ).thenAnswer((_) async => expectedFailure);
        return cartViewModel.doIntent(
          OnClearUserCartEvent(),
        );
      },
      expect: () => [state.copyWith(cartDataErrorMessage: expectedError)],
      verify: (_) {
        verify(
          mockedClearUserCartUseCase.call()
        ).called(1);
      },
    );
  });
}
