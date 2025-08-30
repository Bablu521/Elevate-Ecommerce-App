import 'package:bloc_test/bloc_test.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/category_entity.dart';
import 'package:elevate_ecommerce_app/domin/use_case/get_all_categories_use_case.dart';
import 'package:elevate_ecommerce_app/domin/use_case/get_all_products_use_case.dart';
import 'package:elevate_ecommerce_app/domin/use_case/get_products_by_category_use_case.dart';
import 'package:elevate_ecommerce_app/presentation/categories/view_models/categories_events.dart';
import 'package:elevate_ecommerce_app/presentation/categories/view_models/categories_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'categories_view_model_test.mocks.dart';

@GenerateMocks([GetAllCategoriesUseCase, GetAllProductsUseCase, GetProductsByCategoryUseCase])
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
      state = CategoriesState();
    });

    group("test GetAllCategoriesUseCase", () {
      var expectedList = [
        CategoryEntity(
            Id: "1",
            name: "test",
            slug: "test",
            image: "test",
            createdAt: "time",
            updatedAt: "time",
            isSuperAdmin: false,
            productsCount: 10
        ),
        CategoryEntity(
            Id: "2",
            name: "test2",
            slug: "test2",
            image: "test2",
            createdAt: "time2",
            updatedAt: "time2",
            isSuperAdmin: false,
            productsCount: 20
        )
      ];

      var expectedResult = ApiSuccessResult<List<CategoryEntity>>(
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
          categoriesViewModel.initTabBarController(expectedList.length);
          return bloc.doIntent(GetCategoriesEvent());
        },
        expect:
            () => <CategoriesState>[
          state.copyWith(isLoading: true),
              state.copyWith(categoriesList: expectedList, isLoading: false),
        ],
        verify: (_) {
          verify(
            mockGetAllCategoriesUseCase(),
          ).called(1);
        },
      );


    });
  });
}