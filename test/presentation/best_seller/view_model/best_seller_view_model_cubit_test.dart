import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/core/base_state/base_state.dart';
import 'package:elevate_ecommerce_app/domin/entities/best_seller_entity.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/get_best_seller_use_case.dart';
import 'package:elevate_ecommerce_app/presentation/best_seller/view_model/best_seller_event.dart';
import 'package:elevate_ecommerce_app/presentation/best_seller/view_model/best_seller_view_model_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../fixtures/home_fixtures.dart';
import 'best_seller_view_model_cubit_test.mocks.dart';

@GenerateMocks([GetBestSellerUseCase])
void main() {
  late MockGetBestSellerUseCase mockGetBestSellerUseCase;
  late BestSellerViewModelCubit bestSellerViewModelCubit;
  late BestSellerViewModelState state;
  final DioException dioException = DioException(
    requestOptions: RequestOptions(),
    message: "fake_dio_error",
  );
  setUp(() {
    mockGetBestSellerUseCase = MockGetBestSellerUseCase();
    bestSellerViewModelCubit = BestSellerViewModelCubit(
      mockGetBestSellerUseCase,
    );
    state = const BestSellerViewModelState();
  });
  group("test get profile info emit state", () {
    final List<BestSellerProductEntity> listBestSellerProductEntity =
        HomeFixtures.fakeListProductEntity;
    setUp(() {
      provideDummy<ApiResult<List<BestSellerProductEntity>>>(
        ApiSuccessResult<List<BestSellerProductEntity>>(
          listBestSellerProductEntity,
        ),
      );
      provideDummy<ApiResult<List<BestSellerProductEntity>>>(
        ApiErrorResult<List<BestSellerProductEntity>>(dioException),
      );
    });
    blocTest(
      "test emit loading and success",
      build: () => bestSellerViewModelCubit,
      act: (bloc) {
        when(mockGetBestSellerUseCase.call()).thenAnswer(
          (_) async => ApiSuccessResult<List<BestSellerProductEntity>>(
            listBestSellerProductEntity,
          ),
        );
        bloc.doIntent(GetBestSellerEvent());
      },
      expect: () => [
        state.copyWith(stateBestSellerListProduct: BaseState.loading()),
        state.copyWith(
          stateBestSellerListProduct: BaseState.success(
            listBestSellerProductEntity,
          ),
        ),
      ],
      verify: (bloc) {
        verify(mockGetBestSellerUseCase.call()).called(1);
      },
    );
    blocTest(
      "test emit loading and failure",
      build: () => bestSellerViewModelCubit,
      act: (bloc) {
        when(mockGetBestSellerUseCase.call()).thenAnswer(
          (_) async =>
              ApiErrorResult<List<BestSellerProductEntity>>(dioException),
        );
        bloc.doIntent(GetBestSellerEvent());
      },
      expect: () => [
        state.copyWith(stateBestSellerListProduct: BaseState.loading()),
        state.copyWith(
          stateBestSellerListProduct: BaseState.error(
            "An unexpected error occurred: fake_dio_error",
          ),
        ),
      ],
      verify: (bloc) {
        verify(mockGetBestSellerUseCase.call()).called(1);
      },
    );
  });
}
