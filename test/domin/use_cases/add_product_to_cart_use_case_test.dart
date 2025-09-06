import 'package:elevate_ecommerce_app/domin/entities/requests/add_product_to_cart_request_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/add_product_to_cart_use_case.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/cart_response_entity/cart_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/cart_response_entity/cart_item_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/cart_response_entity/cart_response_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/cart_response_entity/product_entity.dart';
import 'package:elevate_ecommerce_app/domin/repositories/cart_repo.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'add_product_to_cart_use_case_test.mocks.dart';

@GenerateMocks([CartRepo])
void main() {
  group('test AddProductToCartUseCase', () {
    late MockCartRepo mockedCartRepo;
    late AddProductToCartUseCase addProductToCartUseCase;
    late AddProductToCartRequestEntity addProductToCartRequestEntity;
    setUp(() {
      mockedCartRepo = MockCartRepo();
      addProductToCartUseCase =  AddProductToCartUseCase(mockedCartRepo);
      addProductToCartRequestEntity = const AddProductToCartRequestEntity(
        product: "fake-product",
        quantity: 5,
      );
    });
    test(
      'when call AddProductToCartUseCase it should return CartResponseEntity from repo with correct parameters',
      () async {
        //Arrange
        final ProductEntity productEntity = ProductEntity(
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

        final CartItemEntity cartItemEntity = CartItemEntity(
          product: productEntity,
          price: 50,
          quantity: 5,
          id: "fake-id",
        );
        final CartEntity cartEntity = CartEntity(
          id: "fake-id",
          user: "fake-user",
          cartItems: [cartItemEntity],
          appliedCoupons: ["fake-coupon"],
          totalPrice: 5,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          v: 5,
        );
        final expectedCartResponseEntity = CartResponseEntity(
          message: "fake-message",
          numOfCartItems: 5,
          cart: cartEntity,
        );
        final expectedResult = ApiSuccessResult(expectedCartResponseEntity);
        provideDummy<ApiResult<CartResponseEntity>>(expectedResult);
        when(
          mockedCartRepo.addProductToCart(addProductToCartRequestEntity),
        ).thenAnswer((_) async => expectedResult);

        //Act
        final result = await addProductToCartUseCase.call(addProductToCartRequestEntity);

        //Assert
        verify(mockedCartRepo.addProductToCart(addProductToCartRequestEntity)).called(1);
        expect(result, isA<ApiSuccessResult<CartResponseEntity>>());
        result as ApiSuccessResult<CartResponseEntity>;
        expect(result.data, expectedCartResponseEntity);
      },
    );

    test(
      'when AddProductToCartUseCase failed it should return an error result',
      () async {
        //Arrange
        final expectedError = "Server Error";
        final expectedResult = ApiErrorResult<CartResponseEntity>(
          expectedError,
        );
        provideDummy<ApiResult<CartResponseEntity>>(expectedResult);
        when(
          mockedCartRepo.addProductToCart(addProductToCartRequestEntity),
        ).thenAnswer((_) async => expectedResult);

        //Act
        final result = await addProductToCartUseCase.call(addProductToCartRequestEntity);

        //Assert
        verify(mockedCartRepo.addProductToCart(addProductToCartRequestEntity)).called(1);
        expect(result, isA<ApiErrorResult<CartResponseEntity>>());
        result as ApiErrorResult<CartResponseEntity>;
        expect(result.errorMessage, expectedError);
      },
    );
  });
}
