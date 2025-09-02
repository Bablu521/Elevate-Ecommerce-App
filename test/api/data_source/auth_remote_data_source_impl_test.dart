import 'package:elevate_ecommerce_app/api/models/register_dto.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/register_request_dto/register_request_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/register_response_dto/register_response_dto.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/register_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/register_request_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_ecommerce_app/api/data_source/auth_remote_data_source_impl.dart';
import 'package:elevate_ecommerce_app/api/client/api_client.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
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
}
