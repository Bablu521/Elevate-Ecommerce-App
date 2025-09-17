import 'package:dio/dio.dart';
import 'package:elevate_ecommerce_app/api/client/api_client.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/login_requests/login_request.dart';
import 'package:elevate_ecommerce_app/api/models/responses/login_response/login_response_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/profile/upload_image_response/upload_image_response_dto.dart';
import 'package:elevate_ecommerce_app/core/constants/end_points.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/login_fixtures.dart';
import '../../fixtures/profile_fixtures.dart';
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
  group("ApiClient Integration Tests", () {
    test("getProfileData returns ProfileInfoResponseDto", () async {
      // Arrange (Mock server response)
      final mockJson = ProfileFixtures.fakeProfileInfoResponse;

      dioAdapter.onGet(
        Endpoints.profileData,
        (server) => server.reply(200, mockJson),
      );

      // Act
      final result = await apiClient.getProfileData();

      // Assert
      expect(result.message, equals(mockJson.message));
      expect(result.user?.email, equals(mockJson.user?.email));
    });

    test("changePassword returns ChangePasswordResponseDto", () async {
      // Arrange
      final request = ProfileFixtures.fakeChangePasswordRequest;

      final mockJson = ProfileFixtures.fakeChangePasswordResponse;

      dioAdapter.onPatch(
        Endpoints.changePassword,
        data: request.toJson(),
        (server) => server.reply(200, mockJson),
      );

      // Act
      final result = await apiClient.changePassword(request);

      // Assert
      expect(result.token, equals(mockJson.token));
      expect(result.message, equals(mockJson.message));
    });

    test("uploadProfileImage returns UploadImageResponseDto", () async {
      // Arrange
      final fakeFile = MultipartFile.fromString(
        'dummy data',
        filename: 'profile.png',
      );

      final mockJson = ProfileFixtures.fakeUploadImageResponse;

      when(
        mockedApiClient.uploadImageProfile(fakeFile),
      ).thenAnswer((_) async => mockJson);
      // Act
      final result = await mockedApiClient.uploadImageProfile(fakeFile);

      // Assert
      expect(result, isA<UploadImageResponseDto>());
      expect(result.message, equals(mockJson.message));
    });
  });
}
