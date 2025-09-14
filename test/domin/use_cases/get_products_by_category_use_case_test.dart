import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/product_entity.dart';
import 'package:elevate_ecommerce_app/domin/repositories/products_repo.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/get_products_by_category_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_products_by_category_use_case_test.mocks.dart';

@GenerateMocks([ProductsRepo])
void main() {
  group('Test GetProductsByCategoryUseCase', () {
    late MockProductsRepo mockedProductRepo;
    late GetProductsByCategoryUseCase getProductsByCategoryUseCase;
    final categoryId = "fake-category-id";
    setUp(() {
      mockedProductRepo = MockProductsRepo();
      getProductsByCategoryUseCase = GetProductsByCategoryUseCase(
        mockedProductRepo,
      );
      
    });
    test(
      'when call getProductsByCategory it should return a list of products from repo with right parameters',
      () async {
        //Arrange
        final expectedProducts = [
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
        final expectedResult = ApiSuccessResult(expectedProducts);
        provideDummy<ApiResult<List<ProductEntity>>>(expectedResult);
        when(
          mockedProductRepo.getProductsByCategory(categoryId),
        ).thenAnswer((_) async => expectedResult);

        //Act
        final result = await getProductsByCategoryUseCase.call(categoryId);

        //Assert
        verify(mockedProductRepo.getProductsByCategory(categoryId)).called(1);
        expect(result, isA<ApiSuccessResult<List<ProductEntity>>>());
        result as ApiSuccessResult<List<ProductEntity>>;
        expect(result.data, equals(expectedProducts));
      },
    );

    test(
      'when getProductsByCategory failed it should return return an error result',
      () async {
        //Arrange
        
        final expectedError = "Server Error";
        final expectedResult = ApiErrorResult<List<ProductEntity>>(expectedError);
        provideDummy<ApiResult<List<ProductEntity>>>(expectedResult);
        when(
          mockedProductRepo.getProductsByCategory(categoryId),
        ).thenAnswer((_) async => expectedResult);

        //Act
        final result = await getProductsByCategoryUseCase.call(categoryId);

        //Assert
        verify(mockedProductRepo.getProductsByCategory(categoryId)).called(1);
        expect(result, isA<ApiErrorResult<List<ProductEntity>>>());
        result as ApiErrorResult<List<ProductEntity>>;
        expect(result.errorMessage, equals(expectedError));
      },
    );
  });
}
