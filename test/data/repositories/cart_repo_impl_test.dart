import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/cart_response_entity/cart_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/cart_response_entity/cart_item_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/cart_response_entity/cart_response_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/product_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/add_product_to_cart_request_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_ecommerce_app/data/repositories/cart_repo_impl.dart';
import 'package:elevate_ecommerce_app/data/data_source/cart_remote_data_source.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'cart_repo_impl_test.mocks.dart';

@GenerateMocks([CartRemoteDataSource])
void main() {
  group('test CartRepoImpl', () {
    late MockCartRemoteDataSource mockedCartRemoteDataSource;
    late CartRepoImpl cartRepoImpl;
    late ProductEntity productEntity;
    late CartItemEntity cartItemEntity;
    late CartEntity cartEntity;
    late CartResponseEntity expectedCartResponseEntity;
    late AddProductToCartRequestEntity addProductToCartRequestEntity;
    final expectedError = "Server Error";
    final productId = "fake-id";
    setUp(() {
      mockedCartRemoteDataSource = MockCartRemoteDataSource();
      cartRepoImpl = CartRepoImpl(mockedCartRemoteDataSource);
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
    });
    test(
      'when call getLoggedUserCart it should return CartResponseEntity from data source with right parameters',
      () async {
        //Arrange
        final expectedResult = ApiSuccessResult(expectedCartResponseEntity);
        provideDummy<ApiResult<CartResponseEntity>>(expectedResult);
        when(
          mockedCartRemoteDataSource.getLoggedUserCart(),
        ).thenAnswer((_) async => expectedResult);

        //Act
        final result = await cartRepoImpl.getLoggedUserCart();

        //Assert
        verify(mockedCartRemoteDataSource.getLoggedUserCart()).called(1);
        expect(result, isA<ApiSuccessResult<CartResponseEntity>>());
        result as ApiSuccessResult<CartResponseEntity>;
        expect(result.data, expectedCartResponseEntity);
      },
    );

    test(
      'when getLoggedUserCart failed it should return an error result',
      () async {
        //Arrange
        final expectedFailure = ApiErrorResult<CartResponseEntity>(
          expectedError,
        );
        provideDummy<ApiResult<CartResponseEntity>>(expectedFailure);
        when(
          mockedCartRemoteDataSource.getLoggedUserCart(),
        ).thenAnswer((_) async => expectedFailure);

        //Act
        final result = await cartRepoImpl.getLoggedUserCart();

        //Assert
        verify(mockedCartRemoteDataSource.getLoggedUserCart()).called(1);
        expect(result, isA<ApiErrorResult<CartResponseEntity>>());
        result as ApiErrorResult<CartResponseEntity>;
        expect(result.errorMessage, expectedError);
      },
    );

    test(
      'when call addProductToCart it should return CartResponseEntity from data source with right parameters',
      () async {
        //Arrange
        final expectedResult = ApiSuccessResult(expectedCartResponseEntity);
        provideDummy<ApiResult<CartResponseEntity>>(expectedResult);
        when(
          mockedCartRemoteDataSource.addProductToCart(
            addProductToCartRequestEntity,
          ),
        ).thenAnswer((_) async => expectedResult);

        //Act
        final result = await cartRepoImpl.addProductToCart(
          addProductToCartRequestEntity,
        );

        //Assert
        verify(
          mockedCartRemoteDataSource.addProductToCart(
            addProductToCartRequestEntity,
          ),
        ).called(1);
        expect(result, isA<ApiSuccessResult<CartResponseEntity>>());
        result as ApiSuccessResult<CartResponseEntity>;
        expect(result.data, expectedCartResponseEntity);
      },
    );

    test(
      'when addProductToCart failed it should return an error result',
      () async {
        //Arrange
        final expectedFailure = ApiErrorResult<CartResponseEntity>(
          expectedError,
        );
        provideDummy<ApiResult<CartResponseEntity>>(expectedFailure);
        when(
          mockedCartRemoteDataSource.addProductToCart(
            addProductToCartRequestEntity,
          ),
        ).thenAnswer((_) async => expectedFailure);

        //Act
        final result = await cartRepoImpl.addProductToCart(
          addProductToCartRequestEntity,
        );

        //Assert
        verify(
          mockedCartRemoteDataSource.addProductToCart(
            addProductToCartRequestEntity,
          ),
        ).called(1);
        expect(result, isA<ApiErrorResult<CartResponseEntity>>());
        result as ApiErrorResult<CartResponseEntity>;
        expect(result.errorMessage, expectedError);
      },
    );

    test(
      'when call deleteSpecificCartItem it should return CartResponseEntity from data source with right parameters',
      () async {
        //Arrange
        final expectedResult = ApiSuccessResult(expectedCartResponseEntity);
        provideDummy<ApiResult<CartResponseEntity>>(expectedResult);
        when(
          mockedCartRemoteDataSource.deleteSpecificCartItem(productId),
        ).thenAnswer((_) async => expectedResult);

        //Act
        final result = await cartRepoImpl.deleteSpecificCartItem(productId);

        //Assert
        verify(mockedCartRemoteDataSource.deleteSpecificCartItem(productId)).called(1);
        expect(result, isA<ApiSuccessResult<CartResponseEntity>>());
        result as ApiSuccessResult<CartResponseEntity>;
        expect(result.data, expectedCartResponseEntity);
      },
    );

    test(
      'when deleteSpecificCartItem failed it should return an error result',
      () async {
        //Arrange
        final expectedFailure = ApiErrorResult<CartResponseEntity>(
          expectedError,
        );
        provideDummy<ApiResult<CartResponseEntity>>(expectedFailure);
        when(
          mockedCartRemoteDataSource.deleteSpecificCartItem(productId),
        ).thenAnswer((_) async => expectedFailure);

        //Act
        final result = await cartRepoImpl.deleteSpecificCartItem(productId);

        //Assert
        verify(mockedCartRemoteDataSource.deleteSpecificCartItem(productId)).called(1);
        expect(result, isA<ApiErrorResult<CartResponseEntity>>());
        result as ApiErrorResult<CartResponseEntity>;
        expect(result.errorMessage, expectedError);
      },
    );

    test(
      'when call clearUserCart it should return CartResponseEntity from data source with right parameters',
      () async {
        //Arrange
        final expectedResult = ApiSuccessResult(expectedCartResponseEntity);
        provideDummy<ApiResult<CartResponseEntity>>(expectedResult);
        when(
          mockedCartRemoteDataSource.clearUserCart(),
        ).thenAnswer((_) async => expectedResult);

        //Act
        final result = await cartRepoImpl.clearUserCart();

        //Assert
        verify(mockedCartRemoteDataSource.clearUserCart()).called(1);
        expect(result, isA<ApiSuccessResult<CartResponseEntity>>());
        result as ApiSuccessResult<CartResponseEntity>;
        expect(result.data, expectedCartResponseEntity);
      },
    );

    test(
      'when clearUserCart failed it should return an error result',
      () async {
        //Arrange
        final expectedFailure = ApiErrorResult<CartResponseEntity>(
          expectedError,
        );
        provideDummy<ApiResult<CartResponseEntity>>(expectedFailure);
        when(
          mockedCartRemoteDataSource.clearUserCart(),
        ).thenAnswer((_) async => expectedFailure);

        //Act
        final result = await cartRepoImpl.clearUserCart();

        //Assert
        verify(mockedCartRemoteDataSource.clearUserCart()).called(1);
        expect(result, isA<ApiErrorResult<CartResponseEntity>>());
        result as ApiErrorResult<CartResponseEntity>;
        expect(result.errorMessage, expectedError);
      },
    );
  });
}
