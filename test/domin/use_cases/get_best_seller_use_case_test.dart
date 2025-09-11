import 'package:dio/dio.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/data/repositories/best_seller_repo_impl.dart';
import 'package:elevate_ecommerce_app/domin/entities/best_seller_entity.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/get_best_seller_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/home_fixtures.dart';
import 'get_best_seller_use_case_test.mocks.dart';

@GenerateMocks([BestSellerRepoImpl])
void main() {
  late MockBestSellerRepoImpl mockBestSeller;
  late GetBestSellerUseCase bestSellerUseCase;
  final List<BestSellerProductEntity> fakeListProductEntity =
      HomeFixtures.fakeListProductEntity;
  final DioException dioException = DioException(
    requestOptions: RequestOptions(),
    message: "fake_dio_message",
  );
  final Exception fakeException = Exception();
  setUp(() {
    mockBestSeller = MockBestSellerRepoImpl();
    bestSellerUseCase = GetBestSellerUseCase(mockBestSeller);
    provideDummy<ApiResult<List<BestSellerProductEntity>>>(
      ApiSuccessResult<List<BestSellerProductEntity>>(fakeListProductEntity),
    );
    provideDummy<ApiResult<List<BestSellerProductEntity>>>(
      ApiErrorResult<List<BestSellerProductEntity>>(fakeException),
    );
  });
  test("best seller success ApiResult List<ProductEntity>", () async {
    final expectResult = ApiSuccessResult<List<BestSellerProductEntity>>(
      fakeListProductEntity,
    );
    when(mockBestSeller.getBestSeller()).thenAnswer((_) async => expectResult);

    final result = await bestSellerUseCase.call();
    expect(result, isA<ApiSuccessResult<List<BestSellerProductEntity>>>());
    expect(
      (result as ApiSuccessResult<List<BestSellerProductEntity>>).data[1].id,
      equals(fakeListProductEntity[0].id),
    );

    verify(mockBestSeller.getBestSeller()).called(1);
  });
  test("best seller use case success ApiResult List<ProductEntity>", () async {
    final expectResult = ApiSuccessResult<List<BestSellerProductEntity>>(
      fakeListProductEntity,
    );
    when(mockBestSeller.getBestSeller()).thenAnswer((_) async => expectResult);

    final result = await bestSellerUseCase.call();
    expect(result, isA<ApiSuccessResult<List<BestSellerProductEntity>>>());
    expect(
      (result as ApiSuccessResult<List<BestSellerProductEntity>>).data[1].id,
      equals(fakeListProductEntity[0].id),
    );

    verify(mockBestSeller.getBestSeller()).called(1);
  });
  test("best seller use case ApiResult dioError", () async {
    final expectResult = ApiErrorResult<List<BestSellerProductEntity>>(
      dioException,
    );
    when(mockBestSeller.getBestSeller()).thenAnswer((_) async => expectResult);

    final result = await bestSellerUseCase.call();
    expect(result, isA<ApiErrorResult<List<BestSellerProductEntity>>>());
    expect(
      (result as ApiErrorResult<List<BestSellerProductEntity>>).errorMessage,
      contains(dioException.message),
    );

    verify(mockBestSeller.getBestSeller()).called(1);
  });
  test("best seller use case ApiResult exception", () async {
    final expectResult = ApiErrorResult<List<BestSellerProductEntity>>(
      fakeException,
    );
    when(mockBestSeller.getBestSeller()).thenAnswer((_) async => expectResult);

    final result = await bestSellerUseCase.call();
    expect(result, isA<ApiErrorResult<List<BestSellerProductEntity>>>());
    expect(
      (result as ApiErrorResult<List<BestSellerProductEntity>>).error,
      equals(fakeException),
    );

    verify(mockBestSeller.getBestSeller()).called(1);
  });
}
