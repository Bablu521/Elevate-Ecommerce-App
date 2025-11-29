import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/data/data_source/products_remote_data_source.dart';
import 'package:elevate_ecommerce_app/data/repositories/products_repo_impl.dart';
import 'package:elevate_ecommerce_app/domin/entities/product_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'product_repo_impl_test.mocks.dart';

@GenerateMocks([ProductsRemoteDataSource])
void main() {
  group('test ProductRepoImpl', () {
    late MockProductsRemoteDataSource mockedProductRemoteDataSource;
    late ProductsRepoImpl productRepoImpl;
    var occasionId = "fake-occasion-id";
    var categoryId = "fake-category-id";
    var expectedError = "Server Error";
    late List<ProductEntity> expectedProducts;
    setUp(() {
      mockedProductRemoteDataSource = MockProductsRemoteDataSource();
      productRepoImpl = ProductsRepoImpl(mockedProductRemoteDataSource);
      expectedProducts = [
        ProductEntity(
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
        ProductEntity(
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
      ];
    });
    test(
      'when call getProductsByOccasion it should return a list of products from data source with right parameters',
      () async {
        var expectedResult = ApiSuccessResult<List<ProductEntity>>(
          expectedProducts,
        );
        provideDummy<ApiResult<List<ProductEntity>>>(expectedResult);
        when(
          mockedProductRemoteDataSource.getProductsByOccasion(occasionId),
        ).thenAnswer((_) async => expectedResult);

        //Act
        var result = await productRepoImpl.getProductsByOccasion(occasionId);

        //Assert
        verify(
          mockedProductRemoteDataSource.getProductsByOccasion(occasionId),
        ).called(1);
        expect(result, isA<ApiSuccessResult<List<ProductEntity>>>());
        result as ApiSuccessResult<List<ProductEntity>>;
        expect(result.data, equals(expectedProducts));
      },
    );

    test(
      'when getProductsByOccasion failed it should return an error result',
      () async {
        var expectedResult = ApiErrorResult<List<ProductEntity>>(
          expectedError,
        );
        provideDummy<ApiResult<List<ProductEntity>>>(expectedResult);
        when(
          mockedProductRemoteDataSource.getProductsByOccasion(occasionId),
        ).thenAnswer((_) async => expectedResult);

        //Act
        var result = await productRepoImpl.getProductsByOccasion(occasionId);

        //Assert
        verify(
          mockedProductRemoteDataSource.getProductsByOccasion(occasionId),
        ).called(1);
        expect(result, isA<ApiErrorResult<List<ProductEntity>>>());
        result as ApiErrorResult<List<ProductEntity>>;
        expect(result.errorMessage, equals(expectedError));
      },
    );

    test(
      'when call getProductsByCategory it should return a list of products from data source with right parameters',
      () async {
        var expectedResult = ApiSuccessResult<List<ProductEntity>>(
          expectedProducts,
        );
        provideDummy<ApiResult<List<ProductEntity>>>(expectedResult);
        when(
          mockedProductRemoteDataSource.getProductsByCategory(categoryId),
        ).thenAnswer((_) async => expectedResult);

        //Act
        var result = await productRepoImpl.getProductsByCategory(categoryId);

        //Assert
        verify(
          mockedProductRemoteDataSource.getProductsByCategory(categoryId),
        ).called(1);
        expect(result, isA<ApiSuccessResult<List<ProductEntity>>>());
        result as ApiSuccessResult<List<ProductEntity>>;
        expect(result.data, equals(expectedProducts));
      },
    );

    test(
      'when getProductsByCategory failed it should return an error result',
      () async {
        var expectedResult = ApiErrorResult<List<ProductEntity>>(expectedError);
        provideDummy<ApiResult<List<ProductEntity>>>(expectedResult);
        when(
          mockedProductRemoteDataSource.getProductsByCategory(categoryId),
        ).thenAnswer((_) async => expectedResult);

        //Act
        var result = await productRepoImpl.getProductsByCategory(categoryId);

        //Assert
        verify(
          mockedProductRemoteDataSource.getProductsByCategory(categoryId),
        ).called(1);
        expect(result, isA<ApiErrorResult<List<ProductEntity>>>());
        result as ApiErrorResult<List<ProductEntity>>;
        expect(result.errorMessage, equals(expectedError));
      },
    );
  });
}
