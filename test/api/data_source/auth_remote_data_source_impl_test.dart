import 'package:elevate_ecommerce_app/api/client/api_client.dart';
import 'package:elevate_ecommerce_app/api/data_source/auth_remote_data_source_impl.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/login_requests/login_request.dart';
import 'package:elevate_ecommerce_app/api/models/responses/login_response/login_response_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/login_fixtures.dart';
import '../client/api_client_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  group("AuthRemoteDataSourceImpl Test Login", () {
    late MockApiClient mockApiClient;
    late AuthRemoteDataSourceImpl authRemoteDataSourceImpl;
    setUpAll(() {
      mockApiClient = MockApiClient();
      authRemoteDataSourceImpl = AuthRemoteDataSourceImpl(mockApiClient);
    });
    test("Login Success", () async {
      //Arrange
      final LoginResponseDto response = LoginTestFixtures.fakeLoginResponse();
      final LoginRequestModel request = LoginTestFixtures.fakeLoginRequest();
      when(mockApiClient.login(request)).thenAnswer((_) async => response);
      //Act
      final result = await authRemoteDataSourceImpl.login(
        loginRequest: request,
      );
      //Assert
      expect(result, isA<LoginResponseDto>());
      verify(mockApiClient.login(request)).called(1);
    });
  });
}
