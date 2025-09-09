import 'package:elevate_ecommerce_app/api/client/api_client.dart';
import 'package:elevate_ecommerce_app/api/data_source/categories_remote_data_source_impl.dart';
import 'package:elevate_ecommerce_app/api/mapper/categories/category_mapper.dart';
import 'package:elevate_ecommerce_app/api/models/responses/categories/categories_response.dart';
import 'package:elevate_ecommerce_app/api/models/responses/categories/category_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/meta_data.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/category_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'categories_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  group("test CategoriesRemoteDataSourceImpl", () {
    late MockApiClient mockApiClient;
    late CategoriesRemoteDataSourceImpl categoriesRemoteDataSourceImpl;

    setUp(() {
      mockApiClient = MockApiClient();
      categoriesRemoteDataSourceImpl = CategoriesRemoteDataSourceImpl(
        mockApiClient,
      );
    });

    test(
      "when call getAllCategories it should return a list of CategoryEntity from api client with right parameters",
      () async {
        final expectedResult = CategoriesResponse(
          message: "fake-message",
          metadata: MetaData(
            currentPage: 1,
            limit: 1,
            totalPages: 1,
            totalItems: 1,
          ),
          categories: [
            CategoryDTO(
              id: "fake-id-1",
              name: "fake-name-1",
              slug: "fake-slug-1",
              image: "fake-image-1",
              createdAt: "fake-created-at-1",
              updatedAt: "fake-updated-at-1",
              isSuperAdmin: false,
              productsCount: 1,
            ),
            CategoryDTO(
              id: "fake-id-2",
              name: "fake-name-2",
              slug: "fake-slug-2",
              image: "fake-image-2",
              createdAt: "fake-created-at-2",
              updatedAt: "fake-updated-at-2",
              isSuperAdmin: false,
              productsCount: 2,
            ),
          ],
        );

        when(
          mockApiClient.getAllCategories(),
        ).thenAnswer((_) async => expectedResult);

        final result = await categoriesRemoteDataSourceImpl.getAllCategories();

        verify(mockApiClient.getAllCategories()).called(1);
        expect(result, isA<ApiSuccessResult<List<CategoryEntity>>>());
        result as ApiSuccessResult<List<CategoryEntity>>;
        expect(
          result.data,
          equals(
            expectedResult.categories!.map((dto) => dto.toEntity()).toList(),
          ),
        );
      },
    );

    test(
      'when getAllCategories failed it should return an error result',
      () async {
        final expectedError = "Server Error";
        when(
          mockApiClient.getAllCategories(),
        ).thenThrow(Exception(expectedError));

        final result = await categoriesRemoteDataSourceImpl.getAllCategories();

        verify(mockApiClient.getAllCategories()).called(1);
        expect(result, isA<ApiErrorResult<List<CategoryEntity>>>());
        result as ApiErrorResult<List<CategoryEntity>>;
        expect(result.errorMessage, contains(expectedError));
      },
    );
  });
}
