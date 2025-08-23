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
  late MockAuthRepoImpl mockAuthRepoImpl;
  late LoginUseCase loginUseCase;
  setUpAll(() {
    mockAuthRepoImpl = MockAuthRepoImpl();
    loginUseCase = LoginUseCase(mockAuthRepoImpl);
  });
  group("Login UseCase Test", () {
    test("should call AuthRepo.login once and return same result", () async {
      // Arrange
      final loginRequest = LoginTestFixtures.fakeLoginRequest();
      final loginEntity = LoginEntity(userToken: "token", message: "ok");
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
