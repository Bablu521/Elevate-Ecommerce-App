import 'package:elevate_ecommerce_app/api/models/requestes/add_product_to_cart_request_dto/add_product_to_cart_request_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/cart_response_dto/cart_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/cart_response_dto/cart_item_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/cart_response_dto/cart_response_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/cart_response_dto/product_dto.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/cart_response_entity/cart_response_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/add_product_to_cart_request_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_ecommerce_app/api/data_source/cart_remote_data_source_impl.dart';
import 'package:elevate_ecommerce_app/api/client/api_client.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'cart_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  group('test cartRemoteDataSourceImpl', () {
    late MockApiClient mockedApiClient;
    late CartRemoteDataSourceImpl cartRemoteDataSourceImpl;
    late ProductDto productDto;
    late CartItemDto cartItemDto;
    late CartDto cartDto;
    late CartResponseDto cartResponseDto;
    late AddProductToCartRequestEntity addProductToCartRequestEntity;
    final expectedError = "Server Error";
    final productId = "fake-id";
    setUp(() {
      mockedApiClient = MockApiClient();
      cartRemoteDataSourceImpl = CartRemoteDataSourceImpl(mockedApiClient);
      productDto = ProductDto(
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

      cartItemDto = CartItemDto(
        product: productDto,
        price: 50,
        quantity: 5,
        id: "fake-id",
      );
      cartDto = CartDto(
        id: "fake-id",
        user: "fake-user",
        cartItems: [cartItemDto],
        appliedCoupons: ["fake-coupon"],
        totalPrice: 5,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        v: 5,
      );
      cartResponseDto = CartResponseDto(
        message: "fake-message",
        numOfCartItems: 5,
        cart: cartDto,
      );
      addProductToCartRequestEntity = const AddProductToCartRequestEntity(
        product: "fake-product",
        quantity: 5,
      );
    });
    test(
      'when call getLoggedUserCart it should return CartResponseEntity from Api with correct Parameters',
      () async {
        //Arrange
        final expectedResult = cartResponseDto;
        when(
          mockedApiClient.getLoggedUserCart(),
        ).thenAnswer((_) async => expectedResult);

        //Act
        final result = await cartRemoteDataSourceImpl.getLoggedUserCart();

        //Assert
        verify(mockedApiClient.getLoggedUserCart()).called(1);
        expect(result, isA<ApiSuccessResult<CartResponseEntity>>());
        result as ApiSuccessResult<CartResponseEntity>;
        expect(result.data, cartResponseDto.toCartResponseEntity());
      },
    );

    test(
      'when getLoggedUserCart failed it should return an error result',
      () async {
        //Arrange
        when(
          mockedApiClient.getLoggedUserCart(),
        ).thenThrow(Exception(expectedError));

        //Act
        final result = await cartRemoteDataSourceImpl.getLoggedUserCart();

        //Assert
        verify(mockedApiClient.getLoggedUserCart()).called(1);
        expect(result, isA<ApiErrorResult<CartResponseEntity>>());
        result as ApiErrorResult<CartResponseEntity>;
        expect(result.errorMessage, contains(expectedError));
      },
    );

    test(
      'when call addProductToCart it should return CartResponseEntity from Api with correct Parameters',
      () async {
        //Arrange
        final expectedResult = cartResponseDto;
        when(
          mockedApiClient.addProductToCart(AddProductToCartRequestDto.fromDomain(addProductToCartRequestEntity)),
        ).thenAnswer((_) async => expectedResult);

        //Act
        final result = await cartRemoteDataSourceImpl.addProductToCart(addProductToCartRequestEntity);

        //Assert
        verify(mockedApiClient.addProductToCart(AddProductToCartRequestDto.fromDomain(addProductToCartRequestEntity))).called(1);
        expect(result, isA<ApiSuccessResult<CartResponseEntity>>());
        result as ApiSuccessResult<CartResponseEntity>;
        expect(result.data, cartResponseDto.toCartResponseEntity());
      },
    );

    test(
      'when addProductToCart failed it should return an error result',
      () async {
        //Arrange
        when(
          mockedApiClient.addProductToCart(AddProductToCartRequestDto.fromDomain(addProductToCartRequestEntity)),
        ).thenThrow(Exception(expectedError));

        //Act
        final result = await cartRemoteDataSourceImpl.addProductToCart(addProductToCartRequestEntity);

        //Assert
        verify(mockedApiClient.addProductToCart(AddProductToCartRequestDto.fromDomain(addProductToCartRequestEntity))).called(1);
        expect(result, isA<ApiErrorResult<CartResponseEntity>>());
        result as ApiErrorResult<CartResponseEntity>;
        expect(result.errorMessage, contains(expectedError));
      },
    );

      test(
      'when call deleteSpecificCartItem it should return CartResponseEntity from Api with correct Parameters',
      () async {
        //Arrange
        final expectedResult = cartResponseDto;
        when(
          mockedApiClient.deleteSpecificCartItem(productId),
        ).thenAnswer((_) async => expectedResult);

        //Act
        final result = await cartRemoteDataSourceImpl.deleteSpecificCartItem(productId);

        //Assert
        verify(mockedApiClient.deleteSpecificCartItem(productId)).called(1);
        expect(result, isA<ApiSuccessResult<CartResponseEntity>>());
        result as ApiSuccessResult<CartResponseEntity>;
        expect(result.data, cartResponseDto.toCartResponseEntity());
      },
    );

    test(
      'when deleteSpecificCartItem failed it should return an error result',
      () async {
        //Arrange
        when(
          mockedApiClient.deleteSpecificCartItem(productId),
        ).thenThrow(Exception(expectedError));

        //Act
        final result = await cartRemoteDataSourceImpl.deleteSpecificCartItem(productId);

        //Assert
        verify(mockedApiClient.deleteSpecificCartItem(productId)).called(1);
        expect(result, isA<ApiErrorResult<CartResponseEntity>>());
        result as ApiErrorResult<CartResponseEntity>;
        expect(result.errorMessage, contains(expectedError));
      },
    );

      test(
      'when call clearUserCart it should return CartResponseEntity from Api with correct Parameters',
      () async {
        //Arrange
        final expectedResult = cartResponseDto;
        when(
          mockedApiClient.clearUserCart(),
        ).thenAnswer((_) async => expectedResult);

        //Act
        final result = await cartRemoteDataSourceImpl.clearUserCart();

        //Assert
        verify(mockedApiClient.clearUserCart()).called(1);
        expect(result, isA<ApiSuccessResult<CartResponseEntity>>());
        result as ApiSuccessResult<CartResponseEntity>;
        expect(result.data, cartResponseDto.toCartResponseEntity());
      },
    );

    test(
      'when clearUserCart failed it should return an error result',
      () async {
        //Arrange
        when(
          mockedApiClient.clearUserCart(),
        ).thenThrow(Exception(expectedError));

        //Act
        final result = await cartRemoteDataSourceImpl.clearUserCart();

        //Assert
        verify(mockedApiClient.clearUserCart()).called(1);
        expect(result, isA<ApiErrorResult<CartResponseEntity>>());
        result as ApiErrorResult<CartResponseEntity>;
        expect(result.errorMessage, contains(expectedError));
      },
    );

  });
}
