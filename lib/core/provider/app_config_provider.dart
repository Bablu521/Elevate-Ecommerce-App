import 'package:elevate_ecommerce_app/core/constants/const_keys.dart';
import 'package:elevate_ecommerce_app/core/di/di.dart';
import 'package:flutter/material.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppConfigProvider extends ChangeNotifier {
  final FlutterSecureStorage _secureStorage = getIt.get<FlutterSecureStorage>();

  String? _local;

  String? get local => _local;

  Future<void> saveLocal(String value) async {
    await _secureStorage.write(key: ConstKeys.local, value: value);
    _local = value;
  }

  Future<void> getLocal() async {
    _local = await _secureStorage.read(key: 'local');
    notifyListeners();
  }

  Future<void> changeLocal(String value) async {
    await saveLocal(value);
    notifyListeners();
  }
}
