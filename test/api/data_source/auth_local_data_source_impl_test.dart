import 'package:elevate_ecommerce_app/api/data_source/auth_local_data_source_impl.dart';
import 'package:elevate_ecommerce_app/core/constants/const_keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'auth_local_data_source_impl_test.mocks.dart';

@GenerateMocks([FlutterSecureStorage])
void main() {
  group("AuthLocalDataSourceImpl Login", () {
    late MockFlutterSecureStorage mockSecureStorage;
    late AuthLocalDataSourceImpl authLocalDataSource;

    setUp(() {
      mockSecureStorage = MockFlutterSecureStorage();
      authLocalDataSource = AuthLocalDataSourceImpl(
        secureStorage: mockSecureStorage,
      );
    });
    test("should save rememberMe correctly", () async {
      // Arrange

      const rememberMe = true;

      // Act
      await authLocalDataSource.saveUserRememberMe(rememberMe: rememberMe);

      // Assert
      verify(
        mockSecureStorage.write(
          key: ConstKeys.keyRememberMe,
          value: rememberMe.toString(),
        ),
      ).called(1);
    });

    test("should save userStatus correctly", () async {
      // Arrange
      const status = "active";

      // Act
      await authLocalDataSource.saveUserStatus(userStatus: status);

      // Assert
      verify(
        mockSecureStorage.write(key: ConstKeys.keyUserStatus, value: status),
      ).called(1);
    });

    test("should save token correctly", () async {
      // Arrange
      const token = "fake_token";

      // Act
      await authLocalDataSource.saveUserToken(token: token);

      // Assert
      verify(
        mockSecureStorage.write(key: ConstKeys.keyUserToken, value: token),
      ).called(1);
    });
  });
}
