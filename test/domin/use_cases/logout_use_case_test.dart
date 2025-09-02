import 'package:elevate_ecommerce_app/data/repositories/auth_repo_impl.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/logout_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_use_case_test.mocks.dart';

@GenerateMocks([AuthRepoImpl])
void main() {
  group('logout use case ...', () {
    late MockAuthRepoImpl mockAuthRepoImpl;
    late LogoutUseCase logoutUseCase;
    setUp(() {
      mockAuthRepoImpl = MockAuthRepoImpl();
      logoutUseCase = LogoutUseCase(mockAuthRepoImpl);
    });
    test("user logout usecase success", () async {
      // Arrange
      when(
        mockAuthRepoImpl.userLogout(),
      ).thenAnswer((_) async => Future.value());

      // Act
      await logoutUseCase.call();

      // Assert
      verify(mockAuthRepoImpl.userLogout()).called(1);
    });
    test("user logout failure", () async {
      // Arrange
      when(mockAuthRepoImpl.userLogout()).thenThrow(Exception("Logout failed"));

      // Act
      final call = logoutUseCase.call();

      // Assert
      expect(call, throwsA(isA<Exception>()));
      verify(mockAuthRepoImpl.userLogout()).called(1);
    });
  });
}
