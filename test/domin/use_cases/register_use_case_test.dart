import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/register_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/register_request_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/register_use_case.dart';
import 'package:elevate_ecommerce_app/domin/repositories/auth_repo.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'register_use_case_test.mocks.dart';

@GenerateMocks([AuthRepo])
void main() {
  group('test RegisterUseCase', () {
    late MockAuthRepo mockedAuthRepo;
    late RegisterUseCase registerUseCase;
    late RegisterRequestEntity registerRequestEntity;
    setUp(() {
      mockedAuthRepo = MockAuthRepo();
      registerUseCase = RegisterUseCase(mockedAuthRepo);
      registerRequestEntity = RegisterRequestEntity(
        firstName: "fake-firstName",
        lastName: "fake-lastName",
        email: "fake-email",
        password: "fake-password",
        rePassword: "fake-rePassword",
        phone: "fake-phone",
        gender: "fake-gender",
      );
    });
    test(
      'when call RegisterUseCase it should return RegisterEntity from repo with correct parameters',
      () async {
        //Arrange
        var expectedEntity = RegisterEntity(
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
        );
        var expectedResult = ApiSuccessResult(expectedEntity);
        provideDummy<ApiResult<RegisterEntity>>(expectedResult);
        when(
          mockedAuthRepo.register(registerRequestEntity),
        ).thenAnswer((_) async => expectedResult);

        //Act
        var result = await registerUseCase.call(registerRequestEntity);

        //Assert
        verify(mockedAuthRepo.register(registerRequestEntity)).called(1);
        expect(result, isA<ApiSuccessResult<RegisterEntity>>());
        result as ApiSuccessResult<RegisterEntity>;
        expect(result.data, expectedEntity);
      },
    );

    test(
      'when RegisterUseCase failed it should return an error result',
      () async {
        //Arrange
        var expectedError = "Server Error";
        var expectedResult = ApiErrorResult<RegisterEntity>(expectedError);
        provideDummy<ApiResult<RegisterEntity>>(expectedResult);
        when(
          mockedAuthRepo.register(registerRequestEntity),
        ).thenAnswer((_) async => expectedResult);

        //Act
        var result = await registerUseCase.call(registerRequestEntity);

        //Assert
        verify(mockedAuthRepo.register(registerRequestEntity)).called(1);
        expect(result, isA<ApiErrorResult<RegisterEntity>>());
        result as ApiErrorResult<RegisterEntity>;
        expect(result.errorMessage, expectedError);
      },
    );
  });
}
