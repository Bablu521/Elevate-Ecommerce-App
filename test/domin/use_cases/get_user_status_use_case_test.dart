import 'package:elevate_ecommerce_app/data/repositories/auth_repo_impl.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/get_user_status_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_use_case_test.mocks.dart';

@GenerateMocks([AuthRepoImpl])
void main() {
  group('get user status use case ...', () {
    late MockAuthRepoImpl mockAuthRepoImpl;
    late GetUserStatusUseCase getUserStatusUseCase;
    setUp(() {
      mockAuthRepoImpl = MockAuthRepoImpl();
      getUserStatusUseCase = GetUserStatusUseCase(mockAuthRepoImpl);
    });
    test("user status login", () async {
      //Arrange
      const bool expectResult = true;
      when(
        mockAuthRepoImpl.getUserStatus(),
      ).thenAnswer((_) async => expectResult);
      //Act
      final bool result = await getUserStatusUseCase.call();
      //Assert
      expect(result, isA<bool>());
      expect(result, equals(expectResult));
      verify(mockAuthRepoImpl.getUserStatus()).called(1);
    });
    test("user status login failure", () async {
      // Arrange
      when(mockAuthRepoImpl.getUserStatus()).thenThrow(Exception());

      // Act & Assert
      expect(
        () async => await getUserStatusUseCase.call(),
        throwsA(isA<Exception>()),
      );
      verify(mockAuthRepoImpl.getUserStatus()).called(1);
    });
  });
}
