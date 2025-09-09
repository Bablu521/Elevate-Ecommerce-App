import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/request/verify_reset_request_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/auth/response/verify_reset_entity.dart';
import 'package:elevate_ecommerce_app/domin/repositories/auth_repo.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/verify_reset_code_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'verify_reset_code_use_case_test.mocks.dart';

@GenerateMocks([AuthRepo])
void main() {
  group('test VerifyResetCodeUseCase', () {
    late MockAuthRepo mockAuthRepo;
    late VerifyResetCodeUseCase verifyResetCodeUseCase;
    late VerifyResetRequestEntity verifyResetRequestEntity;

    setUp(() {
      mockAuthRepo = MockAuthRepo();
      verifyResetCodeUseCase = VerifyResetCodeUseCase(mockAuthRepo);
      verifyResetRequestEntity =const  VerifyResetRequestEntity(
        resetCode: "fake-reset-code",
      );
    });

    test(
      "when call VerifyResetCodeUseCase it should return VerifyResetEntity from repo with correct parameters",
      () async {
        //Arrange
        final expectedEntity = VerifyResetEntity(status: "fake-status");
        final expectedResult = ApiSuccessResult<VerifyResetEntity>(
          expectedEntity,
        );
        provideDummy<ApiResult<VerifyResetEntity>>(expectedResult);
        when(
          mockAuthRepo.verifyResetCode(verifyResetRequestEntity),
        ).thenAnswer((_) async => expectedResult);

        //Act
        final result = await verifyResetCodeUseCase(verifyResetRequestEntity);

        //Assert
        verify(
          mockAuthRepo.verifyResetCode(verifyResetRequestEntity),
        ).called(1);
        expect(result, isA<ApiSuccessResult<VerifyResetEntity>>());
        result as ApiSuccessResult<VerifyResetEntity>;
        expect(result.data.status, equals(expectedEntity.status));
      },
    );

    test(
      'when VerifyResetCodeUseCase failed it should return an error result',
      () async {
        //Arrange
        final expectedError = "Server Error";
        final expectedResult = ApiErrorResult<VerifyResetEntity>(expectedError);
        provideDummy<ApiResult<VerifyResetEntity>>(expectedResult);
        when(
          mockAuthRepo.verifyResetCode(verifyResetRequestEntity),
        ).thenAnswer((_) async => expectedResult);

        //Act
        final result = await verifyResetCodeUseCase(verifyResetRequestEntity);

        //Assert
        verify(
          mockAuthRepo.verifyResetCode(verifyResetRequestEntity),
        ).called(1);
        expect(result, isA<ApiErrorResult<VerifyResetEntity>>());
        result as ApiErrorResult<VerifyResetEntity>;
        expect(result.errorMessage, expectedError);
      },
    );
  });
}
