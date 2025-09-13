import 'package:dio/dio.dart';
import 'package:elevate_ecommerce_app/api/client/api_client.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/login_requests/login_request.dart';
import 'package:elevate_ecommerce_app/api/models/responses/best_seller/best_seller_response_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/login_response/login_response_dto.dart';
import 'package:elevate_ecommerce_app/core/constants/end_points.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/home_fixtures.dart';
import '../../fixtures/login_fixtures.dart';
import 'api_client_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late ApiClient apiClient;
  late MockApiClient mockedApiClient;
  setUpAll(() {
    dio = Dio(BaseOptions(baseUrl: "https://fakeapi.com"));
    dioAdapter = DioAdapter(dio: dio);
    apiClient = ApiClient(dio);
    mockedApiClient = MockApiClient();
  });
  group("test ApiClient", () {
    test("test Login ApiClient success", () async {
      ///AAA
      ///Arrange
      final LoginResponseDto loginResponseDto =
          LoginTestFixtures.fakeLoginResponse();
      final LoginRequestModel loginRequestModel =
          LoginTestFixtures.fakeLoginRequest();
      when(
        mockedApiClient.login(loginRequestModel),
      ).thenAnswer((_) async => loginResponseDto);

      ///Act
      final result = await mockedApiClient.login(loginRequestModel);

      ///Assert
      expect(result, isA<LoginResponseDto>());
      expect(result.token, equals(loginResponseDto.token));
    });
  });
  group("test ApiClient home page", () {
    test("test get best seller products", () async {
      // AAA
      // ARRANGE
      final fakeResponse = HomeFixtures.fakeProductsResponse;
      dioAdapter.onGet(
        Endpoints.bestSeller,
        (server) => server.reply(200, fakeResponse),
      );
      // ACT
      final result = await apiClient.getBestSeller();
      //ASSERT
      expect(result, isA<BestSellerResponseDto>());
      expect(
        result.bestSeller?[0].price,
        equals(fakeResponse.bestSeller?[0].price),
      );
    });
  });
}
