import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/category_entity.dart';
import 'package:elevate_ecommerce_app/domin/repositories/categories_repo.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/get_all_categories_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_all_categories_use_case_test.mocks.dart';

@GenerateMocks([CategoriesRepo])
void main() {
  group("test GetAllCategoriesUseCase", () {
    late MockCategoriesRepo mockCategoriesRepo;
    late GetAllCategoriesUseCase getAllCategoriesUseCase;

    setUp(() {
      mockCategoriesRepo = MockCategoriesRepo();
      getAllCategoriesUseCase = GetAllCategoriesUseCase(mockCategoriesRepo);
    });

    test(
      'when call getAllCategories it should return a list of CategoryEntity from repo with right parameters',
      () async {
        var expectedList = [
          CategoryEntity(
            Id: "fake-id-1",
            name: "fake-name-1",
            slug: "fake-slug-1",
            image: "fake-image-1",
            createdAt: "fake-created-at-1",
            updatedAt: "fake-updated-at-1",
            isSuperAdmin: false,
            productsCount: 1,
          ),
          CategoryEntity(
            Id: "fake-id-2",
            name: "fake-name-2",
            slug: "fake-slug-2",
            image: "fake-image-2",
            createdAt: "fake-created-at-2",
            updatedAt: "fake-updated-at-2",
            isSuperAdmin: false,
            productsCount: 2,
          ),
        ];
        var expectedResult = ApiSuccessResult(expectedList);
        provideDummy<ApiResult<List<CategoryEntity>>>(expectedResult);
        when(
          mockCategoriesRepo.getAllCategories(),
        ).thenAnswer((_) async => expectedResult);

        var result = await getAllCategoriesUseCase();

        verify(mockCategoriesRepo.getAllCategories()).called(1);
        expect(result, isA<ApiSuccessResult<List<CategoryEntity>>>());
        result as ApiSuccessResult<List<CategoryEntity>>;
        expect(result.data, equals(expectedList));
      },
    );

    test(
      "when getAllCategories failed it should return an error result",
      () async {
        var expectedError = "Server Error";
        var expectedResult = ApiErrorResult<List<CategoryEntity>>(
          expectedError,
        );
        provideDummy<ApiResult<List<CategoryEntity>>>(expectedResult);
        when(
          mockCategoriesRepo.getAllCategories(),
        ).thenAnswer((_) async => expectedResult);

        var result = await getAllCategoriesUseCase.call();

        verify(mockCategoriesRepo.getAllCategories()).called(1);
        expect(result, isA<ApiErrorResult<List<CategoryEntity>>>());
        result as ApiErrorResult<List<CategoryEntity>>;
        expect(result.errorMessage, equals(expectedError));
      },
    );
  });
}
