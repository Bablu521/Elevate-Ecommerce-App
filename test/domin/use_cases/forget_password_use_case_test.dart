import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/request/forget_password_request_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/response/forget_password_entity.dart';
import 'package:elevate_ecommerce_app/domin/repositories/auth_repo.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/forget_password_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'forget_password_use_case_test.mocks.dart';

@GenerateMocks([AuthRepo])
void main() {
  group('test ForgetPasswordUseCase', () {
    late MockAuthRepo mockAuthRepo;
    late ForgetPasswordUseCase forgetPasswordUseCase;
    late ForgetPasswordRequestEntity forgetPasswordRequestEntity;

    setUp((){
      mockAuthRepo = MockAuthRepo();
      forgetPasswordUseCase = ForgetPasswordUseCase(mockAuthRepo);
      forgetPasswordRequestEntity = ForgetPasswordRequestEntity(
        email: "fake-email",
      );
    });

    test("when call ForgetPasswordUseCase it should return ForgetPasswordEntity from repo with correct parameters", () async {
      //Arrange
      var expectedEntity = ForgetPasswordEntity(
        message: "fake-message",
        info: "fake-info"
      );
      var expectedResult = ApiSuccessResult<ForgetPasswordEntity>(expectedEntity);
      provideDummy<ApiResult<ForgetPasswordEntity>>(expectedResult);
      when(
        mockAuthRepo.forgetPassword(forgetPasswordRequestEntity),
      ).thenAnswer((_) async => expectedResult);

      //Act
      var result = await forgetPasswordUseCase(forgetPasswordRequestEntity);

      //Assert
      verify(mockAuthRepo.forgetPassword(forgetPasswordRequestEntity)).called(1);
      expect(result, isA<ApiSuccessResult<ForgetPasswordEntity>>());
      result as ApiSuccessResult<ForgetPasswordEntity>;
      expect(result.data.message, equals(expectedEntity.message));
      expect(result.data.info, equals(expectedEntity.info));
    });

    test(
      'when ForgetPasswordUseCase failed it should return an error result',
          () async {
        //Arrange
        var expectedError = "Server Error";
        var expectedResult = ApiErrorResult<ForgetPasswordEntity>(expectedError);
        provideDummy<ApiResult<ForgetPasswordEntity>>(expectedResult);
        when(
          mockAuthRepo.forgetPassword(forgetPasswordRequestEntity),
        ).thenAnswer((_) async => expectedResult);

        //Act
        var result = await forgetPasswordUseCase(forgetPasswordRequestEntity);

        //Assert
        verify(mockAuthRepo.forgetPassword(forgetPasswordRequestEntity)).called(1);
        expect(result, isA<ApiErrorResult<ForgetPasswordEntity>>());
        result as ApiErrorResult<ForgetPasswordEntity>;
        expect(result.errorMessage, expectedError);
      },
    );
  });
}