import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/core/base_state/base_state.dart';
import 'package:elevate_ecommerce_app/domin/entities/cart_response_entity/cart_response_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/add_product_to_cart_request_entity.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/add_product_to_cart_use_case.dart';
import 'package:elevate_ecommerce_app/presentation/product_details/view_model/product_details_event.dart';
import 'package:elevate_ecommerce_app/presentation/product_details/view_model/product_details_view_model_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../fixtures/home_fixtures.dart';
import '../../cart/view_models/cart_view_model_test.mocks.dart';

@GenerateMocks([AddProductToCartUseCase])
void main() {
  final AddProductToCartRequestEntity requestEntity =
      HomeFixtures.addToCartRequestEntity;
  final CartResponseEntity cartItemEntity = HomeFixtures.fakeCartResponseEntity;
  late MockAddProductToCartUseCase mockAddProductToCartUseCase;
  late ProductDetailsViewModelCubit viewModelCubit;
  late ProductDetailsViewModelState state;
  final DioException dioException = DioException(
    requestOptions: RequestOptions(),
    message: "fake_dio_error",
  );
  setUp(() {
    mockAddProductToCartUseCase = MockAddProductToCartUseCase();
    viewModelCubit = ProductDetailsViewModelCubit(mockAddProductToCartUseCase);
    state = const ProductDetailsViewModelState();
    provideDummy<ApiResult<CartResponseEntity>>(
      ApiSuccessResult<CartResponseEntity>(cartItemEntity),
    );
    provideDummy<ApiResult<CartResponseEntity>>(
      ApiErrorResult<CartResponseEntity>(dioException),
    );
  });
  group("test get profile info emit state", () {
    blocTest(
      "test emit loading and success",
      build: () => viewModelCubit,
      act: (bloc) {
        when(mockAddProductToCartUseCase.call(requestEntity)).thenAnswer(
          (_) async => ApiSuccessResult<CartResponseEntity>(cartItemEntity),
        );
        bloc.doIntent(ProductDetailsAddToCartEvent(request: requestEntity));
      },
      expect: () => [
        state.copyWith(addToCartState: BaseState.loading()),
        state.copyWith(addToCartState: BaseState.success(cartItemEntity)),
      ],
      verify: (bloc) {
        verify(mockAddProductToCartUseCase.call(requestEntity)).called(1);
      },
    );
    blocTest(
      "test emit loading and failure",
      build: () => viewModelCubit,
      act: (bloc) {
        when(mockAddProductToCartUseCase.call(requestEntity)).thenAnswer(
          (_) async => ApiErrorResult<CartResponseEntity>(dioException),
        );
        bloc.doIntent(ProductDetailsAddToCartEvent(request: requestEntity));
      },
      expect: () => [
        state.copyWith(addToCartState: BaseState.loading()),
        state.copyWith(
          addToCartState: BaseState.error(
            "An unexpected error occurred: fake_dio_error",
          ),
        ),
      ],
      verify: (bloc) {
        verify(mockAddProductToCartUseCase.call(requestEntity)).called(1);
      },
    );
    blocTest(
      "test emit change image success",
      build: () => viewModelCubit,
      act: (bloc) {
        bloc.doIntent(ProductDetailsUpdateImageCover(currentIndex: 1));
      },
      expect: () => [state.copyWith(currentIndex: 1)],
    );
  });
}
