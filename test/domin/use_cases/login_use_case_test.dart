import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/data/repositories/auth_repo_impl.dart';
import 'package:elevate_ecommerce_app/domin/entities/login_entity.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/login_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../fixtures/login_fixtures.dart';
import 'login_use_case_test.mocks.dart';

@GenerateMocks([AuthRepoImpl])
void main() {
  group("Login UseCase Test", () {
    late MockAuthRepoImpl mockAuthRepoImpl;
    late LoginUseCase loginUseCase;
    setUp(() {
      mockAuthRepoImpl = MockAuthRepoImpl();
      loginUseCase = LoginUseCase(mockAuthRepoImpl);
      provideDummy<ApiResult<LoginEntity>>(
        ApiSuccessResult<LoginEntity>(
          const LoginEntity(userToken: "dummy", message: "dummy"),
        ),
      );
      provideDummy<ApiResult<LoginEntity>>(
        ApiErrorResult<LoginEntity>(Exception("dummy")),
      );
    });
    final loginEntity = const LoginEntity(userToken: "token", message: "ok");
    test("should call AuthRepo.login once and return same result", () async {
      // Arrange
      final loginRequest = LoginTestFixtures.fakeLoginRequest();
      final expected = ApiSuccessResult<LoginEntity>(loginEntity);
      when(
        mockAuthRepoImpl.login(loginRequestModel: loginRequest),
      ).thenAnswer((_) async => expected);
      // Act
      final result = await loginUseCase.call(requestModel: loginRequest);
      // Assert
      expect(result, expected);
      verify(mockAuthRepoImpl.login(loginRequestModel: loginRequest)).called(1);
      verifyNoMoreInteractions(mockAuthRepoImpl);
    });
  });
}
