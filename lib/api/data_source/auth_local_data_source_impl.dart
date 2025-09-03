import 'package:elevate_ecommerce_app/core/constants/const_keys.dart';
import 'package:elevate_ecommerce_app/data/data_source/auth_local_data_source.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final FlutterSecureStorage secureStorage;

  AuthLocalDataSourceImpl({required this.secureStorage});
  Future<void> _saveValue({required String key, required String value}) async {
    await secureStorage.write(key: key, value: value);
  }

  @override
  Future<void> saveUserRememberMe({required bool rememberMe}) {
    return _saveValue(
      key: ConstKeys.keyRememberMe,
      value: rememberMe.toString(),
    );
  }

  @override
  Future<void> saveUserStatus({required String userStatus}) {
    return _saveValue(key: ConstKeys.keyUserStatus, value: userStatus);
  }

  @override
  Future<void> saveUserToken({required String token}) {
    return _saveValue(key: ConstKeys.keyUserToken, value: token);
  }

  @override
  Future<bool> getUserStatus() async {
    final bool userLogin =
        await secureStorage.read(key: ConstKeys.keyUserStatus) ==
        ConstKeys.kUserLogin;
    return userLogin;
  }

  @override
  Future<void> userLogout() async {
    await secureStorage.delete(key: ConstKeys.keyUserToken);
    await secureStorage.delete(key: ConstKeys.keyRememberMe);
  }
}
