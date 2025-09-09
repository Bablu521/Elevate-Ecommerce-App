import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/data/data_source/categories_remote_data_source.dart';
import 'package:elevate_ecommerce_app/data/repositories/categories_repo_impl.dart';
import 'package:elevate_ecommerce_app/domin/entities/category_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'categories_repo_impl_test.mocks.dart';

@GenerateMocks([CategoriesRemoteDataSource])
void main() {
  group("test CategoriesRepoImpl", () {
    late MockCategoriesRemoteDataSource mockCategoriesRemoteDataSource;
    late CategoriesRepoImpl categoriesRepoImpl;

    setUp(() {
      mockCategoriesRemoteDataSource = MockCategoriesRemoteDataSource();
      categoriesRepoImpl = CategoriesRepoImpl(mockCategoriesRemoteDataSource);
    });

    test(
      'when call getAllCategories it should return a list of CategoryEntity from data source with right parameters',
      () async {
        final expectedList = const [
          CategoryEntity(
            id: "fake-id-1",
            name: "fake-name-1",
            slug: "fake-slug-1",
            image: "fake-image-1",
            createdAt: "fake-created-at-1",
            updatedAt: "fake-updated-at-1",
            isSuperAdmin: false,
            productsCount: 1,
          ),
          CategoryEntity(
            id: "fake-id-2",
            name: "fake-name-2",
            slug: "fake-slug-2",
            image: "fake-image-2",
            createdAt: "fake-created-at-2",
            updatedAt: "fake-updated-at-2",
            isSuperAdmin: false,
            productsCount: 2,
          ),
        ];
        final expectedResult = ApiSuccessResult<List<CategoryEntity>>(
          expectedList,
        );
        provideDummy<ApiResult<List<CategoryEntity>>>(expectedResult);
        when(
          mockCategoriesRemoteDataSource.getAllCategories(),
        ).thenAnswer((_) async => expectedResult);

        final result = await categoriesRepoImpl.getAllCategories();

        verify(mockCategoriesRemoteDataSource.getAllCategories()).called(1);
        expect(result, isA<ApiSuccessResult<List<CategoryEntity>>>());
        result as ApiSuccessResult<List<CategoryEntity>>;
        expect(result.data, equals(expectedList));
      },
    );

    test(
      'when getAllCategories failed it should return an error result',
      () async {
        final expectedError = "Server Error";
        final expectedResult = ApiErrorResult<List<CategoryEntity>>(
          expectedError,
        );
        provideDummy<ApiResult<List<CategoryEntity>>>(expectedResult);
        when(
          mockCategoriesRemoteDataSource.getAllCategories(),
        ).thenAnswer((_) async => expectedResult);

        final result = await categoriesRepoImpl.getAllCategories();

        verify(mockCategoriesRemoteDataSource.getAllCategories()).called(1);
        expect(result, isA<ApiErrorResult<List<CategoryEntity>>>());
        result as ApiErrorResult<List<CategoryEntity>>;
        expect(result.errorMessage, equals(expectedError));
      },
    );
  });
}
