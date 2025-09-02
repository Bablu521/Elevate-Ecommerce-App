import 'package:elevate_ecommerce_app/api/models/product_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/products_reponse_dto/metadata.dart';
import 'package:elevate_ecommerce_app/api/models/responses/products_reponse_dto/products_reponse_dto.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/product_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_ecommerce_app/api/client/api_client.dart';
import 'package:elevate_ecommerce_app/api/data_source/product_remote_data_source_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'product_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  group('test ProductRemoteDataSourceImpl', () {
    late MockApiClient mockedApiClient;
    late ProductRemoteDataSourceImpl productRemoteDataSourceImpl;
    var occasionId = "fake-occasion-id";
    var categoryId = "fake-category-id";
    var expectedError = "Server Error";
    late ProductsReponseDto expectedResult;

    setUp(() {
      mockedApiClient = MockApiClient();
      productRemoteDataSourceImpl = ProductRemoteDataSourceImpl(
        mockedApiClient,
      );
      expectedResult = ProductsReponseDto(
        message: "fake-message",
        metadata: Metadata(
          currentPage: 1,
          limit: 10,
          totalPages: 1,
          totalItems: 2,
        ),
        products: [
          ProductDto(
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
          ProductDto(
            rateAvg: 4,
            rateCount: 5,
            id: "fake-id-2",
            title: "fake-title-2",
            slug: "fake-slug-2",
            description: "fake-description-2",
            imgCover: "fake-imgCover-2",
            images: ["fake-image3", "fake-image4"],
            price: 200,
            priceAfterDiscount: 150,
            quantity: 30,
            category: "fake-category-2",
            occasion: "fake-occasion-2",
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            v: 1,
            isSuperAdmin: false,
            sold: 10,
          ),
        ],
      );
    });
    test(
      'when call getProductsByOccasion it should return a list of products from Api with right parameters',
      () async {
        //Arrange
        when(
          mockedApiClient.getProductsByOccasion(occasionId),
        ).thenAnswer((_) async => expectedResult);

        //Act
        var result = await productRemoteDataSourceImpl.getProductsByOccasion(
          occasionId,
        );

        //Assert
        verify(mockedApiClient.getProductsByOccasion(occasionId)).called(1);
        expect(result, isA<ApiSuccessResult<List<ProductEntity>>>());
        result as ApiSuccessResult<List<ProductEntity>>;
        expect(result.data, expectedResult.products!
            .map((element) => element.toProductEntity())
            .toList());
      },
    );

    test(
      'when call getProductsByOccasion and api client throw error it should return an error result',
      () async {
        //Arrange
        when(
          mockedApiClient.getProductsByOccasion(occasionId),
        ).thenThrow(Exception(expectedError));

        //Act
        var result = await productRemoteDataSourceImpl.getProductsByOccasion(
          occasionId,
        );

        //Assert
        verify(mockedApiClient.getProductsByOccasion(occasionId)).called(1);
        expect(result, isA<ApiErrorResult<List<ProductEntity>>>());
        result as ApiErrorResult<List<ProductEntity>>;
        expect(result.errorMessage, contains(expectedError));
      },
    );

    test(
      'when call getProductsByCategory it should return a list of products from Api with right parameters',
      () async {
        //Arrange
        when(
          mockedApiClient.getProductsByCategory(categoryId),
        ).thenAnswer((_) async => expectedResult);

        //Act
        var result = await productRemoteDataSourceImpl.getProductsByCategory(
          categoryId,
        );

        //Assert
        verify(mockedApiClient.getProductsByCategory(categoryId)).called(1);
        expect(result, isA<ApiSuccessResult<List<ProductEntity>>>());
        result as ApiSuccessResult<List<ProductEntity>>;
        expect(
          result.data,
          expectedResult.products!
              .map((element) => element.toProductEntity())
              .toList(),
        );
      },
    );

      test(
      'when call getProductsByCategory and api client throw error it should return an error result',
      () async {
        //Arrange
        when(
          mockedApiClient.getProductsByCategory(categoryId),
        ).thenThrow(Exception(expectedError));

        //Act
        var result = await productRemoteDataSourceImpl.getProductsByCategory(
          categoryId,
        );

        //Assert
        verify(mockedApiClient.getProductsByCategory(categoryId)).called(1);
        expect(result, isA<ApiErrorResult<List<ProductEntity>>>());
        result as ApiErrorResult<List<ProductEntity>>;
        expect(result.errorMessage, contains(expectedError));
      },
    );


  });
}
