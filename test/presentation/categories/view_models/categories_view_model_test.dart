import 'package:bloc_test/bloc_test.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/category_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/product_entity.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/get_all_categories_use_case.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/get_all_products_use_case.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/get_products_by_category_use_case.dart';
import 'package:elevate_ecommerce_app/presentation/categories/view_models/categories_events.dart';
import 'package:elevate_ecommerce_app/presentation/categories/view_models/categories_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'categories_view_model_test.mocks.dart';

@GenerateMocks([
  GetAllCategoriesUseCase,
  GetAllProductsUseCase,
  GetProductsByCategoryUseCase,
])
void main() {
  group("test CategoriesViewModel", () {
    late MockGetAllCategoriesUseCase mockGetAllCategoriesUseCase;
    late MockGetAllProductsUseCase mockGetAllProductsUseCase;
    late MockGetProductsByCategoryUseCase mockGetProductsByCategoryUseCase;
    late CategoriesViewModel categoriesViewModel;
    late CategoriesState state;

    setUp(() {
      mockGetAllCategoriesUseCase = MockGetAllCategoriesUseCase();
      mockGetAllProductsUseCase = MockGetAllProductsUseCase();
      mockGetProductsByCategoryUseCase = MockGetProductsByCategoryUseCase();
      categoriesViewModel = CategoriesViewModel(
        mockGetAllCategoriesUseCase,
        mockGetProductsByCategoryUseCase,
        mockGetAllProductsUseCase,
      );
      state = const CategoriesState();
    });

    group("test GetAllCategoriesUseCase", () {
      final expectedList = [
        const CategoryEntity(
          id: "1",
          name: "test",
          slug: "test",
          image: "test",
          createdAt: "time",
          updatedAt: "time",
          isSuperAdmin: false,
          productsCount: 10,
        ),
        const CategoryEntity(
          id: "2",
          name: "test2",
          slug: "test2",
          image: "test2",
          createdAt: "time2",
          updatedAt: "time2",
          isSuperAdmin: false,
          productsCount: 20,
        ),
      ];

      final expectedResult = ApiSuccessResult<List<CategoryEntity>>(
        expectedList,
      );
      provideDummy<ApiResult<List<CategoryEntity>>>(expectedResult);

      blocTest<CategoriesViewModel, CategoriesState>(
        'call doIntent with GetCategoriesEvent then load and succeeded',
        build: () => categoriesViewModel,
        act: (bloc) {
          when(
            mockGetAllCategoriesUseCase(),
          ).thenAnswer((_) async => expectedResult);
          return bloc.doIntent(GetCategoriesEvent());
        },
        expect: () => <CategoriesState>[
          state.copyWith(isLoading: true, errorMessage: null),
          state.copyWith(categoriesList: expectedList, isLoading: false),
        ],
        verify: (_) {
          verify(mockGetAllCategoriesUseCase()).called(1);
        },
      );

      final errorMessage = "Server Error";
      final expectedError = ApiErrorResult<List<CategoryEntity>>(errorMessage);
      provideDummy<ApiResult<List<CategoryEntity>>>(expectedError);

      blocTest<CategoriesViewModel, CategoriesState>(
        "call doIntent with GetCategoriesEvent then load and failed",
        build: () => categoriesViewModel,
        act: (bloc) async {
          when(
            mockGetAllCategoriesUseCase(),
          ).thenAnswer((_) async => expectedError);
          return bloc.doIntent(GetCategoriesEvent());
        },
        expect: () => [
          state.copyWith(isLoading: true, errorMessage: null),
          state.copyWith(errorMessage: errorMessage, isLoading: false),
        ],
        verify: (_) {
          verify(mockGetAllCategoriesUseCase()).called(1);
        },
      );
    });

    group("test GetAllProductsUseCase", () {
      final expectedList = [
        ProductEntity(
          rateAvg: 1,
          rateCount: 1,
          id: "1",
          title: "test",
          slug: "test",
          description: "test",
          imgCover: "test",
          images: ["test"],
          price: 1,
          priceAfterDiscount: 1,
          quantity: 1,
          category: "test",
          occasion: "test",
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          v: 1,
          isSuperAdmin: false,
          sold: 1,
        ),
        ProductEntity(
          rateAvg: 2,
          rateCount: 2,
          id: "2",
          title: "test2",
          slug: "test2",
          description: "test2",
          imgCover: "test2",
          images: ["test2"],
          price: 2,
          priceAfterDiscount: 2,
          quantity: 2,
          category: "test2",
          occasion: "test2",
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          v: 2,
          isSuperAdmin: false,
          sold: 2,
        ),
      ];

      final expectedResult = ApiSuccessResult<List<ProductEntity>>(
        expectedList,
      );
      provideDummy<ApiResult<List<ProductEntity>>>(expectedResult);

      blocTest<CategoriesViewModel, CategoriesState>(
        'call doIntent with GetAllProductsEvent then load and succeeded',
        build: () => categoriesViewModel,
        act: (bloc) {
          when(
            mockGetAllProductsUseCase(),
          ).thenAnswer((_) async => expectedResult);
          return bloc.doIntent(GetAllProductsEvent());
        },
        expect: () => <CategoriesState>[
          state.copyWith(isProductsLoading: true, errorMessage: null),
          state.copyWith(productsList: expectedList, isProductsLoading: false),
        ],
        verify: (_) {
          verify(mockGetAllProductsUseCase()).called(1);
        },
      );

      final errorMessage = "Server Error";
      final expectedError = ApiErrorResult<List<ProductEntity>>(errorMessage);
      provideDummy<ApiResult<List<ProductEntity>>>(expectedError);

      blocTest<CategoriesViewModel, CategoriesState>(
        "call doIntent with GetAllProductsEvent then load and failed",
        build: () => categoriesViewModel,
        act: (bloc) async {
          when(
            mockGetAllProductsUseCase(),
          ).thenAnswer((_) async => expectedError);
          return bloc.doIntent(GetAllProductsEvent());
        },
        expect: () => [
          state.copyWith(isLoading: true, errorMessage: null),
          state.copyWith(errorMessage: errorMessage, isProductsLoading: false),
        ],
        verify: (_) {
          verify(mockGetAllProductsUseCase()).called(1);
        },
      );
    });

    group("test GetProductsByCategoryUseCase", () {
      final categoryId = "1";

      final categoriesList = [
        const CategoryEntity(
          id: "1",
          name: "test",
          slug: "test",
          image: "test",
          createdAt: "time",
          updatedAt: "time",
          isSuperAdmin: false,
          productsCount: 10,
        ),
        const CategoryEntity(
          id: "2",
          name: "test2",
          slug: "test2",
          image: "test2",
          createdAt: "time2",
          updatedAt: "time2",
          isSuperAdmin: false,
          productsCount: 20,
        ),
      ];

      final expectedList = [
        ProductEntity(
          rateAvg: 1,
          rateCount: 1,
          id: "1",
          title: "test",
          slug: "test",
          description: "test",
          imgCover: "test",
          images: ["test"],
          price: 1,
          priceAfterDiscount: 1,
          quantity: 1,
          category: "test",
          occasion: "test",
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          v: 1,
          isSuperAdmin: false,
          sold: 1,
        ),
        ProductEntity(
          rateAvg: 2,
          rateCount: 2,
          id: "2",
          title: "test2",
          slug: "test2",
          description: "test2",
          imgCover: "test2",
          images: ["test2"],
          price: 2,
          priceAfterDiscount: 2,
          quantity: 2,
          category: "test2",
          occasion: "test2",
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          v: 2,
          isSuperAdmin: false,
          sold: 2,
        ),
      ];

      final expectedResult = ApiSuccessResult<List<ProductEntity>>(
        expectedList,
      );
      provideDummy<ApiResult<List<ProductEntity>>>(expectedResult);

      blocTest<CategoriesViewModel, CategoriesState>(
        'call doIntent with GetProductsByCategoryEvent then load and succeeded',
        build: () => categoriesViewModel,
        act: (bloc) {
          when(
            mockGetProductsByCategoryUseCase(categoryId),
          ).thenAnswer((_) async => expectedResult);
          bloc.categoriesList = categoriesList;
          bloc.selectedTabIndex.value = 1;
          return bloc.doIntent(GetProductsByCategoryEvent());
        },
        expect: () => <CategoriesState>[
          state.copyWith(isProductsLoading: true, errorMessage: null),
          state.copyWith(productsList: expectedList, isProductsLoading: false),
        ],
        verify: (_) {
          verify(mockGetProductsByCategoryUseCase(categoryId)).called(1);
        },
      );

      final errorMessage = "Server Error";
      final expectedError = ApiErrorResult<List<ProductEntity>>(errorMessage);
      provideDummy<ApiResult<List<ProductEntity>>>(expectedError);

      blocTest<CategoriesViewModel, CategoriesState>(
        "call doIntent with GetProductsByCategoryEvent then load and failed",
        build: () => categoriesViewModel,
        act: (bloc) async {
          when(
            mockGetProductsByCategoryUseCase(categoryId),
          ).thenAnswer((_) async => expectedError);
          bloc.categoriesList = categoriesList;
          bloc.selectedTabIndex.value = 1;
          return bloc.doIntent(GetProductsByCategoryEvent());
        },
        expect: () => [
          state.copyWith(isLoading: true, errorMessage: null),
          state.copyWith(errorMessage: errorMessage, isProductsLoading: false),
        ],
        verify: (_) {
          verify(mockGetProductsByCategoryUseCase(categoryId)).called(1);
        },
      );
    });
  });
}
