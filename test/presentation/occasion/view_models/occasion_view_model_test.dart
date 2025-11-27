import 'package:dio/dio.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/core/base_state/base_state.dart';
import 'package:elevate_ecommerce_app/domin/entities/cart_response_entity/cart_response_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/occasion_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/product_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/add_product_to_cart_request_entity.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/add_product_to_cart_use_case.dart';
import 'package:elevate_ecommerce_app/presentation/occasion/view_models/occasion_events.dart';
import 'package:elevate_ecommerce_app/presentation/occasion/view_models/occasion_states.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/occasion_use_case.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/get_products_by_occasion_use_case.dart';
import 'package:elevate_ecommerce_app/presentation/occasion/view_models/occasion_view_model.dart';
import 'package:mockito/annotations.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';

import '../../../fixtures/home_fixtures.dart';
import 'occasion_view_model_test.mocks.dart';

@GenerateMocks([
  OccasionUseCase,
  GetProductsByOccasionUseCase,
  AddProductToCartUseCase,
])
void main() {
  group('test OccasionViewModel', () {
    late MockOccasionUseCase mockedOccasionUseCase;
    late MockGetProductsByOccasionUseCase mockedGetProductsByOccasionUseCase;
    late MockAddProductToCartUseCase mockAddProductToCartUseCase;
    late OccasionViewModel occasionViewModel;
    late OccasionStates state;
    final occasionId = "fake-occasion-id";
    final errorMsg = "Server Error";

    setUp(() {
      mockedOccasionUseCase = MockOccasionUseCase();
      mockedGetProductsByOccasionUseCase = MockGetProductsByOccasionUseCase();
      mockAddProductToCartUseCase = MockAddProductToCartUseCase();
      occasionViewModel = OccasionViewModel(
        mockedOccasionUseCase,
        mockedGetProductsByOccasionUseCase,
        mockAddProductToCartUseCase,
      );
      state = const OccasionStates();
    });
    final expectedOccasionEntity = [
      OccasionEntity(
        id: "fake-id-1",
        name: "fake-name-1",
        slug: "fake-slug-1",
        image: "fake-image-1",
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        isSuperAdmin: false,
        productsCount: 0,
      ),
      OccasionEntity(
        id: "fake-id-2",
        name: "fake-name-2",
        slug: "fake-slug-2",
        image: "fake-image-2",
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        isSuperAdmin: false,
        productsCount: 0,
      ),
    ];
    final expectedResult = ApiSuccessResult(expectedOccasionEntity);
    provideDummy<ApiResult<List<OccasionEntity>>>(expectedResult);
    blocTest<OccasionViewModel, OccasionStates>(
      'call doIntent with OnLoadOccasionListEvent then load and successed',
      build: () => occasionViewModel,
      act: (occasionViewModel) async {
        when(
          mockedOccasionUseCase.call(),
        ).thenAnswer((_) async => expectedResult);
        return occasionViewModel.doIntent(OnLoadOccasionListEvent());
      },
      expect: () => [
        state.copyWith(occasionListIsLoading: true),
        state.copyWith(
          occasionListIsLoading: false,
          occasionListSuccess: expectedOccasionEntity,
        ),
      ],
      verify: (_) {
        verify(mockedOccasionUseCase.call()).called(1);
      },
    );

    final expectedError = ApiErrorResult<List<OccasionEntity>>(errorMsg);
    provideDummy<ApiResult<List<OccasionEntity>>>(expectedError);
    blocTest<OccasionViewModel, OccasionStates>(
      'call doIntent with OnLoadOccasionListEvent then load and failed',
      build: () => occasionViewModel,
      act: (occasionViewModel) async {
        when(
          mockedOccasionUseCase.call(),
        ).thenAnswer((_) async => expectedError);
        return occasionViewModel.doIntent(OnLoadOccasionListEvent());
      },
      expect: () => [
        state.copyWith(occasionListIsLoading: true),
        state.copyWith(
          occasionListIsLoading: false,
          occasionListErrorMessage: errorMsg,
        ),
      ],
      verify: (_) {
        verify(mockedOccasionUseCase.call()).called(1);
      },
    );
    final expectedProductEntity = [
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
    final expectedProducts = ApiSuccessResult(expectedProductEntity);
    provideDummy<ApiResult<List<ProductEntity>>>(expectedProducts);
    blocTest<OccasionViewModel, OccasionStates>(
      'call doIntent with OnLoadProductListEvent then load and successed',
      build: () => occasionViewModel,
      act: (occasionViewModel) async {
        when(
          mockedGetProductsByOccasionUseCase.call(occasionId),
        ).thenAnswer((_) async => expectedProducts);
        return occasionViewModel.doIntent(OnLoadProductListEvent(occasionId));
      },
      expect: () => [
        state.copyWith(productListIsLoading: true),
        state.copyWith(
          productListIsLoading: false,
          productListSuccess: expectedProductEntity,
        ),
      ],
      verify: (_) {
        verify(mockedGetProductsByOccasionUseCase.call(occasionId)).called(1);
      },
    );

    final expectedfailure = ApiErrorResult<List<ProductEntity>>(errorMsg);
    provideDummy<ApiResult<List<ProductEntity>>>(expectedfailure);
    blocTest<OccasionViewModel, OccasionStates>(
      'call doIntent with OnLoadProductListEvent then load and failed',
      build: () => occasionViewModel,
      act: (occasionViewModel) async {
        when(
          mockedGetProductsByOccasionUseCase.call(occasionId),
        ).thenAnswer((_) async => expectedfailure);
        return occasionViewModel.doIntent(OnLoadProductListEvent(occasionId));
      },
      expect: () => [
        state.copyWith(productListIsLoading: true),
        state.copyWith(
          productListIsLoading: false,
          productListErrorMessage: errorMsg,
        ),
      ],
      verify: (_) {
        verify(mockedGetProductsByOccasionUseCase.call(occasionId)).called(1);
      },
    );
  });
  group("test add to cart emit state", () {
    late MockOccasionUseCase mockedOccasionUseCase;
    late MockGetProductsByOccasionUseCase mockedGetProductsByOccasionUseCase;
    late MockAddProductToCartUseCase mockAddProductToCartUseCase;
    late OccasionViewModel occasionViewModel;
    late OccasionStates state;
    final CartResponseEntity cartResponseEntity =
        HomeFixtures.fakeCartResponseEntity;
    final AddProductToCartRequestEntity request =
        HomeFixtures.addToCartRequestEntity;
    final DioException dioException = DioException(
      requestOptions: RequestOptions(),
      message: "fake_dio_error",
    );
    setUp(() {
      mockedOccasionUseCase = MockOccasionUseCase();
      mockedGetProductsByOccasionUseCase = MockGetProductsByOccasionUseCase();
      mockAddProductToCartUseCase = MockAddProductToCartUseCase();
      occasionViewModel = OccasionViewModel(
        mockedOccasionUseCase,
        mockedGetProductsByOccasionUseCase,
        mockAddProductToCartUseCase,
      );
      state = const OccasionStates();
      provideDummy<ApiResult<CartResponseEntity>>(
        ApiSuccessResult<CartResponseEntity>(cartResponseEntity),
      );
      provideDummy<ApiResult<CartResponseEntity>>(
        ApiErrorResult<CartResponseEntity>(dioException),
      );
    });
    blocTest(
      "test emit loading and success",
      build: () => occasionViewModel,
      act: (bloc) {
        when(mockAddProductToCartUseCase.call(request)).thenAnswer(
          (_) async => ApiSuccessResult<CartResponseEntity>(cartResponseEntity),
        );
        bloc.doIntent(OccasionAddToCartEvent(productId: request.product));
      },
      expect: () => [
        state.copyWith(
          cartStates: {
            ...state.cartStates,
            request.product: BaseState.loading(),
          },
        ),
        state.copyWith(
          cartStates: {
            ...state.cartStates,
            request.product: BaseState.success(cartResponseEntity),
          },
        ),
      ],

      verify: (bloc) {
        verify(mockAddProductToCartUseCase.call(request)).called(1);
      },
    );
    blocTest(
      "test emit loading and failure",
      build: () => occasionViewModel,
      act: (bloc) {
        when(mockAddProductToCartUseCase.call(request)).thenAnswer(
          (_) async => ApiErrorResult<CartResponseEntity>(dioException),
        );
        bloc.doIntent(OccasionAddToCartEvent(productId: request.product));
      },
      expect: () => [
        state.copyWith(
          cartStates: {
            ...state.cartStates,
            request.product: BaseState.loading(),
          },
        ),
        state.copyWith(
          cartStates: {
            ...state.cartStates,
            request.product: BaseState.error(
              "An unexpected error occurred: fake_dio_error",
            ),
          },
        ),
      ],
      verify: (bloc) {
        verify(mockAddProductToCartUseCase.call(request)).called(1);
      },
    );
  });
}
