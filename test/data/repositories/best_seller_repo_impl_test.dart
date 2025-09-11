import 'package:dio/dio.dart';
import 'package:elevate_ecommerce_app/api/data_source/best_seller_date_source_impl.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/data/repositories/best_seller_repo_impl.dart';
import 'package:elevate_ecommerce_app/domin/entities/best_seller_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/home_fixtures.dart';
import 'best_seller_repo_impl_test.mocks.dart';

@GenerateMocks([BestSellerRemoteDataSourceImpl])
void main() {
  late MockBestSellerRemoteDataSourceImpl mockBestSellerRemoteDataSourceImpl;
  late BestSellerRepoImpl bestSellerRepoImpl;
  final List<BestSellerProductEntity> fakeListProductEntity =
      HomeFixtures.fakeListProductEntity;
  final DioException dioException = DioException(
    requestOptions: RequestOptions(),
    message: "fake_dio_message",
  );
  final Exception fakeException = Exception();
  setUp(() {
    mockBestSellerRemoteDataSourceImpl = MockBestSellerRemoteDataSourceImpl();
    bestSellerRepoImpl = BestSellerRepoImpl(
      mockBestSellerRemoteDataSourceImpl,
    );
    provideDummy<ApiResult<List<BestSellerProductEntity>>>(
      ApiSuccessResult<List<BestSellerProductEntity>>(fakeListProductEntity),
    );
    provideDummy<ApiResult<List<BestSellerProductEntity>>>(
      ApiErrorResult<List<BestSellerProductEntity>>(fakeException),
    );
  });
  test("best seller success ApiResult List<BestSellerProductEntity>", () async {
    final expectResult = ApiSuccessResult<List<BestSellerProductEntity>>(
      fakeListProductEntity,
    );
    when(
      mockBestSellerRemoteDataSourceImpl.getBestSeller(),
    ).thenAnswer((_) async => expectResult);

    final result = await bestSellerRepoImpl.getBestSeller();
    expect(result, isA<ApiSuccessResult<List<BestSellerProductEntity>>>());
    expect(
      (result as ApiSuccessResult<List<BestSellerProductEntity>>).data[1].id,
      equals(fakeListProductEntity[0].id),
    );

    verify(mockBestSellerRemoteDataSourceImpl.getBestSeller()).called(1);
  });
  test("best seller failure ApiResult DioError", () async {
    final expectResult = ApiErrorResult<List<BestSellerProductEntity>>(dioException);
    when(
      mockBestSellerRemoteDataSourceImpl.getBestSeller(),
    ).thenAnswer((_) async => expectResult);

    final result = await bestSellerRepoImpl.getBestSeller();
    expect(result, isA<ApiErrorResult<List<BestSellerProductEntity>>>());
    expect(
      (result as ApiErrorResult<List<BestSellerProductEntity>>).errorMessage,
      contains(dioException.message),
    );

    verify(mockBestSellerRemoteDataSourceImpl.getBestSeller()).called(1);
  });
  test("best seller failure ApiResult Exception", () async {
    final expectResult = ApiErrorResult<List<BestSellerProductEntity>>(fakeException);
    when(
      mockBestSellerRemoteDataSourceImpl.getBestSeller(),
    ).thenAnswer((_) async => expectResult);

    final result = await bestSellerRepoImpl.getBestSeller();
    expect(result, isA<ApiErrorResult<List<BestSellerProductEntity>>>());
    expect(
      (result as ApiErrorResult<List<BestSellerProductEntity>>).error,
      equals(fakeException),
    );

    verify(mockBestSellerRemoteDataSourceImpl.getBestSeller()).called(1);
  });
}
