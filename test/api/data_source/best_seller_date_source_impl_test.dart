import 'package:dio/dio.dart';
import 'package:elevate_ecommerce_app/api/client/api_client.dart';
import 'package:elevate_ecommerce_app/api/data_source/best_seller_date_source_impl.dart';
import 'package:elevate_ecommerce_app/api/models/responses/best_seller/best_seller_response_dto.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/best_seller_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../fixtures/home_fixtures.dart';
import '../client/api_client_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  late MockApiClient mockApiClient;
  late BestSellerRemoteDataSourceImpl bestSellerRemoteDataSourceImpl;
  final List<BestSellerProductEntity> fakeListProductEntity =
      HomeFixtures.fakeListProductEntity;
  final BestSellerResponseDto bestSellerResponseDto =
      HomeFixtures.fakeProductsResponse;
  final DioException dioException = DioException(
    requestOptions: RequestOptions(),
    message: "fake_dio_message",
  );
  final Exception fakeException = Exception();
  setUp(() {
    mockApiClient = MockApiClient();
    bestSellerRemoteDataSourceImpl = BestSellerRemoteDataSourceImpl(
      mockApiClient,
    );
  });
  test('best seller return success', () async {
    when(
      mockApiClient.getBestSeller(),
    ).thenAnswer((_) async => bestSellerResponseDto);

    final result = await bestSellerRemoteDataSourceImpl.getBestSeller();

    expect(result, isA<ApiResult<List<BestSellerProductEntity>>>());
    expect(
      (result) as ApiSuccessResult<List<BestSellerProductEntity>>,
      isA<ApiSuccessResult<List<BestSellerProductEntity>>>(),
    );
    expect(result.data[0].price, equals(fakeListProductEntity[0].price));
    verify(mockApiClient.getBestSeller()).called(1);
  });
  test('best seller return dio exception', () async {
    when(mockApiClient.getBestSeller()).thenThrow(dioException);

    final result = await bestSellerRemoteDataSourceImpl.getBestSeller();

    expect(result, isA<ApiResult<List<BestSellerProductEntity>>>());
    expect(
      (result) as ApiErrorResult<List<BestSellerProductEntity>>,
      isA<ApiErrorResult<List<BestSellerProductEntity>>>(),
    );
    expect(result.errorMessage, contains(dioException.message));
    verify(mockApiClient.getBestSeller()).called(1);
  });
  test('best seller return exception', () async {
    when(mockApiClient.getBestSeller()).thenThrow(fakeException);

    final result = await bestSellerRemoteDataSourceImpl.getBestSeller();

    expect(result, isA<ApiResult<List<BestSellerProductEntity>>>());
    expect(
      (result) as ApiErrorResult<List<BestSellerProductEntity>>,
      isA<ApiErrorResult<List<BestSellerProductEntity>>>(),
    );
    expect(result.error, equals(fakeException));
    verify(mockApiClient.getBestSeller()).called(1);
  });
}
