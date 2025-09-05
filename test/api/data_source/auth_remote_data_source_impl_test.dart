import 'package:dio/dio.dart';
import 'package:elevate_ecommerce_app/api/models/register_dto.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/profile_request/change_password_request/change_password_request.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/profile_request/update_profile_info_request/update_profile_info_request.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/register_request_dto/register_request_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/profile/change_password_response/change_password_response_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/profile/profile_info_response/profile_info_response_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/profile/update_profile_info_response/update_profile_info_response_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/profile/upload_image_response/upload_image_response_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/register_response_dto/register_response_dto.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/register_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/register_request_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_ecommerce_app/api/data_source/auth_remote_data_source_impl.dart';
import 'package:elevate_ecommerce_app/api/client/api_client.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../fixtures/profile_fixtures.dart';
import 'auth_remote_data_source_impl_test.mocks.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/login_requests/login_request.dart';
import 'package:elevate_ecommerce_app/api/models/responses/login_response/login_response_dto.dart';

import '../../fixtures/login_fixtures.dart';

@GenerateMocks([ApiClient])
void main() {
  group('test AuthRemoteDataSourceImpl', () {
    late MockApiClient mockedApiClient;
    late AuthRemoteDataSourceImpl authRemoteDataSourceImpl;
    late RegisterRequestEntity registerRequestEntity;
    late RegisterRequestDto registerRequestDto;

    setUp(() {
      mockedApiClient = MockApiClient();
      authRemoteDataSourceImpl = AuthRemoteDataSourceImpl(mockedApiClient);
      registerRequestEntity = const RegisterRequestEntity(
        firstName: "fake-firstName",
        lastName: "fake-lastName",
        email: "fake-email",
        password: "fake-password",
        rePassword: "fake-rePassword",
        phone: "fake-phone",
        gender: "fake-gender",
      );
      registerRequestDto = RegisterRequestDto.fromDomain(registerRequestEntity);
    });
    test(
      'when call register it should return RegisterEntity from Api with correct Parameters',
      () async {
        //Arrange

        final expectedResult = const RegisterResponseDto(
          message: "fake-message",
          token: "fake-token",
          user: RegisterDto(
            firstName: "fake-firstName",
            lastName: "fake-lastName",
            email: "fake-email",
            gender: "fake-gender",
            phone: "fake-phone",
            photo: "fake-photo",
            role: "fake-role",
            wishlist: ["fake-wishlist"],
            id: "fake-id",
            addresses: ["fake-addresses"],
          ),
        );
        when(
          mockedApiClient.register(registerRequestDto),
        ).thenAnswer((_) async => expectedResult);

        //Act
        final result = await authRemoteDataSourceImpl.register(
          registerRequestEntity,
        );

        //Assert
        verify(mockedApiClient.register(registerRequestDto)).called(1);
        expect(result, isA<ApiSuccessResult<RegisterEntity>>());
        result as ApiSuccessResult<RegisterEntity>;
        expect(result.data, expectedResult.user!.toRegisterEntity());
      },
    );

    test("when register failed it should return an error result", () async {
      //Arrange
      final expectedError = "Server Error";
      when(
        mockedApiClient.register(registerRequestDto),
      ).thenThrow(Exception(expectedError));

      //Act
      final result = await authRemoteDataSourceImpl.register(
        registerRequestEntity,
      );

      //Assert
      verify(mockedApiClient.register(registerRequestDto)).called(1);
      expect(result, isA<ApiErrorResult<RegisterEntity>>());
      result as ApiErrorResult<RegisterEntity>;
      expect(result.errorMessage, contains(expectedError));
    });

    test("Login Success", () async {
      //Arrange
      final LoginResponseDto response = LoginTestFixtures.fakeLoginResponse();
      final LoginRequestModel request = LoginTestFixtures.fakeLoginRequest();
      when(mockedApiClient.login(request)).thenAnswer((_) async => response);
      //Act
      final result = await authRemoteDataSourceImpl.login(
        loginRequest: request,
      );
      //Assert
      expect(result, isA<LoginResponseDto>());
      verify(mockedApiClient.login(request)).called(1);
    });
  });
  group("profile functionality success call", () {
    late MockApiClient mockedApiClient;
    setUp(() {
      mockedApiClient = MockApiClient();
    });
    test("get user info ApiClient success", () async {
      ///AAA
      ///Arrange
      final ProfileInfoResponseDto profileInfoResponseDto =
          ProfileFixtures.fakeProfileInfoResponse;
      when(
        mockedApiClient.getProfileData(),
      ).thenAnswer((_) async => profileInfoResponseDto);

      ///Act
      final result = await mockedApiClient.getProfileData();

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
        mockedApiClient.updateProfileData(updateProfileInfoRequest),
      ).thenAnswer((_) async => updateProfileInfoResponseDto);

      ///Act
      final result = await mockedApiClient.updateProfileData(
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
        mockedApiClient.uploadImageProfile(request),
      ).thenAnswer((_) async => response);

      ///Act
      final result = await mockedApiClient.uploadImageProfile(request);

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
        mockedApiClient.changePassword(request),
      ).thenAnswer((_) async => response);

      ///Act
      final result = await mockedApiClient.changePassword(request);

      ///Assert
      expect(result, isA<ChangePasswordResponseDto>());
      expect(result.token, equals(response.token));
    });
  });
}
