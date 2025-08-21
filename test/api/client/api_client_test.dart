import 'package:elevate_ecommerce_app/api/client/api_client.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/login_requests/login_request.dart';
import 'package:elevate_ecommerce_app/api/models/responses/login_response/login_response_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/login_fixtures.dart';
import 'api_client_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  late MockApiClient mockApiClient;
  setUpAll(() {
    mockApiClient = MockApiClient();
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
        mockApiClient.login(loginRequestModel),
      ).thenAnswer((_) async => loginResponseDto);

      ///Act
      final result = await mockApiClient.login(loginRequestModel);

      ///Assert
      expect(result, isA<LoginResponseDto>());
      expect(result.token, equals(loginResponseDto.token));
    });
  });
}
