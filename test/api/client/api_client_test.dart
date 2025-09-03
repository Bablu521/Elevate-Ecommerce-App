import 'package:dio/dio.dart';
import 'package:elevate_ecommerce_app/api/client/api_client.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/login_requests/login_request.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/profile_request/change_password_request/change_password_request.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/profile_request/update_profile_info_request/update_profile_info_request.dart';
import 'package:elevate_ecommerce_app/api/models/responses/login_response/login_response_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/profile/change_password_response/change_password_response_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/profile/profile_info_response/profile_info_response_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/profile/update_profile_info_response/update_profile_info_response_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/profile/upload_image_response/upload_image_response_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/login_fixtures.dart';
import '../../fixtures/profile_fixtures.dart';
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
  group("test ApiClient profile function is correctly", () {
    test("get user info ApiClient success", () async {
      ///AAA
      ///Arrange
      final ProfileInfoResponseDto profileInfoResponseDto =
          ProfileFixtures.fakeProfileInfoResponse;
      when(
        mockApiClient.getProfileData(),
      ).thenAnswer((_) async => profileInfoResponseDto);

      ///Act
      final result = await mockApiClient.getProfileData();

      ///Assert
      expect(result, isA<ProfileInfoResponseDto>());
      expect(result.message, equals(profileInfoResponseDto.message));
    });
    test("update user info ApiClient success", () async {
      ///AAA
      ///Arrange
      final UpdateProfileInfoRequest updateProfileInfoRequest =
          ProfileFixtures.fakeUpdateProfileRequest;
      final UpdateProfileInfoResponseDto updateProfileInfoResponseDto =
          ProfileFixtures.fakeUpdateProfileResponse;
      when(
        mockApiClient.updateProfileData(updateProfileInfoRequest),
      ).thenAnswer((_) async => updateProfileInfoResponseDto);

      ///Act
      final result = await mockApiClient.updateProfileData(
        updateProfileInfoRequest,
      );

      ///Assert
      expect(result, isA<UpdateProfileInfoResponseDto>());
      expect(
        result.user?.email,
        equals(updateProfileInfoResponseDto.user?.email),
      );
    });
    test("upload profile image ApiClient success", () async {
      ///AAA
      ///Arrange
      final MultipartFile request = MultipartFile.fromString(
        'dummy data',
        filename: 'profile.png',
      );
      final UploadImageResponseDto response =
          ProfileFixtures.fakeUploadImageResponse;
      when(
        mockApiClient.uploadImageProfile(request),
      ).thenAnswer((_) async => response);

      ///Act
      final result = await mockApiClient.uploadImageProfile(request);

      ///Assert
      expect(result, isA<UploadImageResponseDto>());
      expect(result.message, equals(response.message));
    });
    test("change password ApiClient success", () async {
      ///AAA
      ///Arrange
      final ChangePasswordRequest request =
          ProfileFixtures.fakeChangePasswordRequest;
      final ChangePasswordResponseDto response =
          ProfileFixtures.fakeChangePasswordResponse;
      when(
        mockApiClient.changePassword(request),
      ).thenAnswer((_) async => response);

      ///Act
      final result = await mockApiClient.changePassword(request);

      ///Assert
      expect(result, isA<ChangePasswordResponseDto>());
      expect(result.token, equals(response.token));
    });
  });
}
