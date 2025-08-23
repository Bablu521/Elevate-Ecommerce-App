import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/request/reset_password_request_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/response/reset_password_entity.dart';
import 'package:elevate_ecommerce_app/domin/repositories/auth_repo.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/reset_password_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'reset_password_use_case_test.mocks.dart';

@GenerateMocks([AuthRepo])
void main() {
  group('test ResetPasswordUseCase', () {
    late MockAuthRepo mockAuthRepo;
    late ResetPasswordUseCase resetPasswordUseCase;
    late ResetPasswordRequestEntity resetPasswordRequestEntity;

    setUp((){
      mockAuthRepo = MockAuthRepo();
      resetPasswordUseCase = ResetPasswordUseCase(mockAuthRepo);
      resetPasswordRequestEntity = ResetPasswordRequestEntity(
        email: "fake-email",
        newPassword: "fake-new-password"
      );
    });

    test("when call ResetPasswordUseCase it should return ResetPasswordEntity from repo with correct parameters", () async {
      //Arrange
      var expectedEntity = ResetPasswordEntity(
          message: "fake-message",
          token: "fake-token"
      );
      var expectedResult = ApiSuccessResult<ResetPasswordEntity>(expectedEntity);
      provideDummy<ApiResult<ResetPasswordEntity>>(expectedResult);
      when(
        mockAuthRepo.resetPassword(resetPasswordRequestEntity),
      ).thenAnswer((_) async => expectedResult);

      //Act
      var result = await resetPasswordUseCase(resetPasswordRequestEntity);

      //Assert
      verify(mockAuthRepo.resetPassword(resetPasswordRequestEntity)).called(1);
      expect(result, isA<ApiSuccessResult<ResetPasswordEntity>>());
      result as ApiSuccessResult<ResetPasswordEntity>;
      expect(result.data.message, equals(expectedEntity.message));
      expect(result.data.token, equals(expectedEntity.token));
    });

    test(
      'when ResetPasswordUseCase failed it should return an error result',
          () async {
        //Arrange
        var expectedError = "Server Error";
        var expectedResult = ApiErrorResult<ResetPasswordEntity>(expectedError);
        provideDummy<ApiResult<ResetPasswordEntity>>(expectedResult);
        when(
          mockAuthRepo.resetPassword(resetPasswordRequestEntity),
        ).thenAnswer((_) async => expectedResult);

        //Act
        var result = await resetPasswordUseCase(resetPasswordRequestEntity);

        //Assert
        verify(mockAuthRepo.resetPassword(resetPasswordRequestEntity)).called(1);
        expect(result, isA<ApiErrorResult<ResetPasswordEntity>>());
        result as ApiErrorResult<ResetPasswordEntity>;
        expect(result.errorMessage, expectedError);
      },
    );
  });
}